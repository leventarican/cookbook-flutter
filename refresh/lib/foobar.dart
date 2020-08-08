import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

///
/// - File class for save and read data
/// - parse data from and to JSON
/// - list all entries
/// - entry data
///

class Foobar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'persistence',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomAppBarColor: Colors.blue,
      ),
      home: Home(title: 'home'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _directory;

  Stream<dynamic> _paths = Stream.fromFuture(Utils()._getDir);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                          text: 'create json file and ',
                          style: TextStyle(color: Colors.amberAccent.shade400)),
                      TextSpan(
                          text: 'list folder content',
                          style: TextStyle(letterSpacing: 8.0,fontSize: 36))
                    ]),
              ),
            ),
            SizedBox(
              child: Container(
                height: 16.0,
                color: Colors.amberAccent.shade100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                color: Colors.amberAccent.shade200,
                onPressed: () async {
                  var path = await Utils()._getDir;
                  debugPrint('path : $path');
                  setState(() {
                    _directory = path;
                  });
                  Data data =
                      Data(id: '0', header: 'start', payload: 'hello world.');
                  String dataJson = json.encode(data);
                  await Utils().writeToFile(dataJson);
                  debugPrint(dataJson);
                },
                child: Text('app document directory'),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('directory: $_directory'),
            ),
            SizedBox(
              child: Container(
                height: 16.0,
                color: Colors.amberAccent.shade100,
              ),
            ),
            SingleChildScrollView(
              child: StreamBuilder(
                stream: _paths,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  List<Widget> children;

                  if (snapshot.hasError) {
                    return Text('error');
                  } else {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        children = [
                          Icon(Icons.error),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('error.'),
                          )
                        ];
                        break;
                      case ConnectionState.waiting:
                        children = [
                          SizedBox(
                            child: const CircularProgressIndicator(),
                            width: 60,
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('waiting.'),
                          )
                        ];
                        break;
                      case ConnectionState.active:
                        children = [
                          Icon(Icons.info),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('active.'),
                          )
                        ];
                        break;
                      case ConnectionState.done:
                        // /data/user/0/com.example.refresh/app_flutter
                        var data = snapshot.data;
                        debugPrint('data: $data');
                        children = [];
                        Directory(data).listSync().forEach((element) {
                          children.add(Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('$element'),
                          ));
                          children.add(Divider());
                        });

                        break;
                    }
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// use package path_provider to access Filesystem.
///
class Utils {
  Future<String> get _getDir async {
    Future<Directory> directory = getApplicationDocumentsDirectory();
    directory.then((value) => debugPrint('# dir: $value'));
    return (await directory).path;
  }

  Future<File> get _getFile async {
    final directory = await _getDir;
    return File('$directory/data.json');
  }

  Future<File> writeToFile(String json) async {
    final file = await _getFile;
    return file.writeAsString('$json');
  }
}

///
/// {"id":"0","header":"start","payload":"hello world."}
///
class Data {
  String id;
  String header;
  String payload;

  Data({this.id, this.header, this.payload});

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "payload": payload,
      };
}
