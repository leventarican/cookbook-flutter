import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: listViewBuilderExample(),
//      body: listViewExample(),
//        body: justRow()
    ));
  }
}

class ProgrammingLang extends StatelessWidget {
  var languages = [
    Text("go", style: TextStyle(fontSize: 30.0),),
    Text("kotlin", style: TextStyle(fontSize: 30.0),),
    Text("dart", style: TextStyle(fontSize: 30.0),),
  ];

  var images = [
    Image.asset('assets/images/go.png'),
    Image.asset('assets/images/kotlin.png'),
    FlutterLogo(
      size: 50.0,
    ),
  ];

  var index;
  ProgrammingLang(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          images[index],
          languages[index]
        ],
      ),
    );
  }
}

///use this for intermediate number of objects. kind of recycle view in Android SDK.
///itemBuilder: is a function
listViewBuilderExample() {
  return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int i) {
        return ProgrammingLang(i % 3);
      });
}

listViewExample() {
  return ListView(children: generate(20));
}

/// usually you will get this: A RenderFlex overflowed by (ex.) 10 pixels on the right.
/// in order words: no space for all widgets
justRow() {
  return Row(children: generate(7));
}

generate(int i) {
  var d = <Widget>[];
  for (var j = 0; j < i; j++) {
    d.add(Icon(
      Icons.computer,
      size: 70.0,
    ));
  }
  return d;
}
