import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC pattern',
      home: Text("ready."),
    );
  }
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

  void getData() {
    _service.data("leventarican").then((response) => {
      _controller.sink.add(_deserialize(response))
    });
  }
//  _controller.sink.add(event);

  GithubRepository _deserialize(String response) {
    var j = json.decode(response);
    var githubRepository = new GithubRepository();
    var description = j["description"];
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