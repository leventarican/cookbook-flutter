import 'package:flutter/material.dart';

//simple example with a button and text
class SimpleExample extends StatelessWidget {
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
