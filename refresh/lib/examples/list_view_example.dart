import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewExamplePage(),
    );
  }
}

class ListViewExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TheState();
  }
}

class TheState extends State<ListViewExamplePage> {
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
                child: InkWell(
                    onTap: () => _selaction(_data[index]),
                    child: Text(
                      _data[index],
                      style: TextStyle(fontSize: 100.0, color: Colors.blueGrey),
                    )),
                color: Colors.amberAccent,
                margin: EdgeInsets.all(8),
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.redAccent,
              );
            }));
  }

  void _selaction(String data) {
    debugPrint('tabbed: $data');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '$data',
            style: Theme.of(context).textTheme.headline2,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: RaisedButton(
            child: Text('back'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      );
    }));
  }
}
