import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:refresh/examples/inherited_widget_example.dart';
import 'package:refresh/examples/json_rest_example.dart';
import 'package:refresh/examples/navigation_example.dart';
import 'package:refresh/examples/row_column_example.dart';
import 'package:refresh/examples/simple_example.dart';

import './pages/start_page.dart';
import './pages/programminglanguage_page.dart';

import 'examples/list_view_example.dart';
import 'template/template.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber),
      home: Start(),
    ));

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  clicked(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Examples'),
          backgroundColor: Colors.grey[700],
        ),
        body: ListView(children: [
          MenuButton(
            name: 'listview',
            action: () => clicked(ListViewExamplePage()),
          ),
          MenuButton(
            name: 'navigation',
            action: () => clicked(NavigationExample()),
          ),
          MenuButton(
            name: 'simple',
            action: () => clicked(SimpleExample()),
          ),
          MenuButton(
            name: 'json / rest',
            action: () => clicked(JsonRestExample()),
          ),
          MenuButton(
            name: 'template',
            action: () => clicked(Template()),
          ),
          MenuButton(
            name: 'row column',
            action: () => clicked(RowColumnExample()),
          ),
          MenuButton(
            name: 'start page',
            action: () => clicked(StartPage()),
          ),
          MenuButton(
            name: 'programming language',
            action: () => clicked(ProgrammingLanguagePage()),
          ),
          MenuButton(
            name: 'inherited widget',
            action: () => clicked(InheritedWidgetExample()),
          ),
        ]));
  }
}

class MenuButton extends StatelessWidget {
  final String name;
  final VoidCallback action;

  MenuButton({this.name, this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: MaterialButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: action),
    );
  }
}
