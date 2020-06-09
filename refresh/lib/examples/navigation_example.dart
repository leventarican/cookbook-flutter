import 'package:flutter/material.dart';

const ABOUT_PAGE = "/About";

/// named routes
/// demo of two pages: navigate from one page to another
class NavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: {ABOUT_PAGE: (BuildContext context) => AboutPage()},
    );
  }
}

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
            onPressed: () {
              debugPrint('clicked.');
            },
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
