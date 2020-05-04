import 'package:flutter/material.dart';

import 'dart:convert';
// ensure to add http dependency in pubspec.yaml
import 'package:http/http.dart' as http;

// a public REST-API: https://openlibrary.org/developers/api
const PUBLIC_REST_API = "http://openlibrary.org/works/OL6030812W.json";

//do a REST call and decode the result
class JsonRestExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThePage(),
    );
  }
}

class ThePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TheState();
  }
}

class TheState extends State<ThePage> {
  Map<String, dynamic> _data;
  String _title;

  Future<String> request() async {
    var response = await http.get(Uri.encodeFull(PUBLIC_REST_API),
        headers: {"Accepts": "applications/json"});
    _data = jsonDecode(response.body);
    _title = _data['title'];
    print(_title);
    setState(() => _title);

    return "OK";
  }

  @override
  void initState() {
    super.initState();
    _title = "ready";
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json and REST-API"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_title),
                RaisedButton(
                  child: Text("action"),
                  onPressed: request,
                )
              ],
            ),
          )),
    );
  }
}
