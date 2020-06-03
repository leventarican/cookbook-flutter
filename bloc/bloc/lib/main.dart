import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp(new AppBloc()));
}

class MyApp extends StatelessWidget {
  final AppBloc bloc;

  MyApp(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: MaterialApp(
        home: AppScreen(),
      ),
    );
  }
}

class _AppScreenState extends State<AppScreen> {
  GithubRepository data;

  @override
  Widget build(BuildContext context) {
    final GithubBloc githubBloc = BlocProvider.of(context).githubBloc;

    githubBloc.githubRepositoryStream
        .listen((GithubRepository githubRepository) {
      setState(() {
        data = githubRepository;
      });
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("BLoC"),
        ),
        body: Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            elevation: 10,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              SizedBox(height: 10),
              Text("Github Repository Description"),
              SizedBox(height: 20),
              Center(
                child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Text(
                      "desc: ${data?.description}",
                      style: TextStyle(fontSize: 30),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("next"),
                onPressed: () {
                  githubBloc.streamData();
                },
              ),
            ])));
  }
}

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class GithubService {
  Future<String> data(String user) async {
    var url = "https://api.github.com/users/$user/repos";
    final Client client = new Client();
    final response = await client.get(url);
    return response.body;
  }
}

abstract class Bloc {
  void dispose();
}

class GithubBloc implements Bloc {
  var _controller = StreamController<GithubRepository>.broadcast();
  Stream<GithubRepository> get githubRepositoryStream => _controller.stream;
  var _service = new GithubService();

  void streamData() {
    _service
        .data("leventarican")
        .then((response) => {_controller.sink.add(_deserialize(response))});
  }

  GithubRepository _deserialize(String response) {
    var j = json.decode(response);
    var githubRepository = new GithubRepository();
    var description = j[new Random().nextInt(10)]["description"];

    dev.log("$description");

    githubRepository.description = description;
    return githubRepository;
  }

  @override
  void dispose() {
    _controller.close();
  }
}

class GithubRepository {
  String description;
}

class AppBloc {
  GithubBloc _githubBloc;
  AppBloc() {
    _githubBloc = new GithubBloc();
  }
  GithubBloc get githubBloc => _githubBloc;
}

class BlocProvider extends InheritedWidget {
  final AppBloc bloc;

  BlocProvider({Key key, this.bloc, child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
}
