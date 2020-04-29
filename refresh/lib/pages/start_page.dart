import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueGrey,
      child: new InkWell(
        onTap: () => print("tapped"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("programming", style: new TextStyle(color: Colors.white70, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Text("start", style: new TextStyle(color: Colors.white70, fontSize: 30.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

}