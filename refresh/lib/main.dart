import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import './pages/start_page.dart';
import './pages/programminglanguage_page.dart';

// ensure to add http dependency in pubspec.yaml
import 'package:http/http.dart' as http;

// a public REST-API: https://openlibrary.org/developers/api
const PUBLIC_REST_API = "http://openlibrary.org/works/OL6030812W.json";
const ABOUT_PAGE = "/About";

void main() => runApp(new MaterialApp(
      // #############################################################################
      home: ListViewExample(),

      // #############################################################################
      // # do a REST call and decode the result
//      home: JsonRestExample(),

      // #############################################################################
      // # MainPage is a demo of two pages: navigate from one page to another
//  home: MainPage(),
//  routes: {
//    ABOUT_PAGE: (BuildContext context) => AboutPage()
//  },

      // #############################################################################
      // # Example is a simple example with a button and text
//  home: Example(),

      // #############################################################################
      // # ProgrammingLanguagePage a more sophisticated way
      // based on: https://www.youtube.com/watch?v=jBBl1tYkUnE
      // MaterialApp has home property: will be our start page.
//  home: new ProgrammingLanguagePage(),
    ));

// #############################################################################
class ListViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewExampleState();
  }
}

class ListViewExampleState extends State<ListViewExample> {
  var _data = ["go", "kotlin", "dart", "cpp", "java", "python", "rust", "c"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView Example"),
          backgroundColor: Colors.grey,
        ),
        body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text(_data[index], style: TextStyle(fontSize: 100.0, color: Colors.blueGrey),),
                color: Colors.amberAccent,
                margin: EdgeInsets.all(8),
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.redAccent,
              );
            }));
  }
}

// #############################################################################
class JsonRestExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JsonRestExampleState();
  }
}

class JsonRestExampleState extends State<JsonRestExample> {
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

// #############################################################################
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
      ),
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.computer,
              color: Colors.blueGrey,
            ),
            iconSize: 100.0,
            onPressed: () => Navigator.of(context).pushNamed(ABOUT_PAGE),
          ),
          Text(
            "Dart",
            style: TextStyle(
              fontSize: 50.0,
            ),
          )
        ],
      ))),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.smartphone,
              color: Colors.orangeAccent,
            ),
            iconSize: 100.0,
          ),
          Text("Flutter",
              style: TextStyle(
                fontSize: 50.0,
              )),
        ],
      ))),
    );
  }
}

// #############################################################################
class Example extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExampleState();
  }
}

class ExampleState extends State<Example> {
  // convention over code: _ is private
  var _languages = [
    "go",
    "dart",
    "kotlin",
    "java",
    "c++",
    "python",
    "javascript",
    "c"
  ];
  var _lang = "press button";

  action() {
    setState(() {
      _languages.shuffle();
      _lang = _languages.elementAt(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // a text, some padding, then a button
              Text(_lang, style: TextStyle(fontSize: 50.0)),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              RaisedButton(
                child: Text(
                  "action",
                  style: TextStyle(fontSize: 30.0),
                ),
                color: Colors.lightBlue,
                onPressed: action,
              )
            ],
          ),
        ),
      ),
    );
  }
}
