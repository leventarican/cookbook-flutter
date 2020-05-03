import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
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