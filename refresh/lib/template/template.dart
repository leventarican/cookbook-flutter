import 'package:flutter/material.dart';

//MaterialApp is a Widget which provide us a Drawer, Appbar, ...
class Template extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "template",
        style: TextStyle(fontSize: 100.0),
      ),
    );
  }
}
