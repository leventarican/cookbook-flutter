import 'package:flutter/material.dart';
import 'dart:math' as math;

///
/// demonstration of basic widgets
/// also demo of setstate. like in React.
/// the UI is re-build when the state changes with Stateful widgets.
///
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
        title: Text('setState example & more',
            style: Theme.of(context).textTheme.headline5),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_lang, style: Theme.of(context).textTheme.headline4),
                  Divider(
                    color: Colors.amber.shade100,
                    thickness: 2.0,
                  ),
                  RaisedButton(
                    child: Text(
                      "action",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    color: Colors.amber[200],
                    padding: EdgeInsets.all(16.0),
                    onPressed: _action,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text('Transform',
                      style: Theme.of(context).textTheme.headline4),
                  Divider(
                    color: Colors.amber.shade100,
                    thickness: 2.0,
                  ),
                  Transform.rotate(
                    angle: 45.0 * math.pi / 180.0,
                    child: Transform.scale(
                      scale: 0.5,
                      child: Container(
                        color: Colors.lightGreen.shade100,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                  ),
                  Text('Stack', style: Theme.of(context).textTheme.headline4),
                  Divider(
                    color: Colors.amber.shade100,
                    thickness: 2.0,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.lime[200],
                        radius: 50.0,
                      ),
                      Stack(
                        children: [
                          Container(
                            color: Colors.lightGreen.shade100,
                            height: 40.0,
                            width: 40.0,
                          ),
                          Container(
                            color: Colors.lightGreen.shade200,
                            height: 30.0,
                            width: 30.0,
                          ),
                          Container(
                            color: Colors.lightGreen.shade300,
                            height: 20.0,
                            width: 20.0,
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.lightGreen.shade100,
                        height: 400.0,
                        width: 40.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
