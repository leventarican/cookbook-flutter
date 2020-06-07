import 'package:flutter/material.dart';

class SimpleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThePage(),
    );
  }
}

/// demo of setstate. like in React.
/// the UI is re-build when the state changes with Stateful widgets.
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

  _action() {
    setState(() {
      _languages..shuffle();
      _lang = _languages.first;
      debugPrint(_lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setState example',
            style: Theme.of(context).textTheme.headline4),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // a text, some padding, then a button
              Text(_lang, style: Theme.of(context).textTheme.headline4),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              RaisedButton(
                child: Text(
                  "action",
                  style: Theme.of(context).textTheme.headline4,
                ),
                color: Colors.amber[200],
                padding: EdgeInsets.all(16.0),
                onPressed: _action,
              )
            ],
          ),
        ),
      ),
    );
  }
}
