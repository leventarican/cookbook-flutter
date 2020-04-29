import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import './pages/start_page.dart';
import './pages/programminglanguage_page.dart';

// based on: https://www.youtube.com/watch?v=jBBl1tYkUnE
// MaterialApp has home property: will be our start page.
void main() => runApp(new MaterialApp(
//  home: new ProgrammingLanguagePage(),
  home: Example() ,
));

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
              Text(_lang, style: TextStyle(fontSize: 50.0)),
              RaisedButton(
                child: Text("action", style: TextStyle(fontSize: 30.0),),
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