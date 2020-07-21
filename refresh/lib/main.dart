import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:refresh/animation/animation_package_example.dart';
import 'package:refresh/examples/animation_example.dart';
import 'package:refresh/examples/basic_example.dart';
import 'package:refresh/examples/custom_painter_animated_example.dart';
import 'package:refresh/examples/custom_painter_example.dart';
import 'package:refresh/examples/grid_example.dart';
import 'package:refresh/examples/gridview_model_example.dart';
import 'package:refresh/examples/inherited_widget_example.dart';
import 'package:refresh/examples/json_rest_example.dart';
import 'package:refresh/examples/listview_future_example.dart';
import 'package:refresh/examples/navigation_basic_example.dart';
import 'package:refresh/examples/navigation_example.dart';
import 'package:refresh/examples/row_column_example.dart';
import 'package:refresh/examples/simple_example.dart';
import 'package:refresh/examples/slivers_example.dart';
import 'package:refresh/examples/stateless_example.dart';

import './pages/start_page.dart';
import './pages/programminglanguage_page.dart';

import 'examples/debug.dart';
import 'examples/listview_example.dart';
import 'tabs/tabs_example.dart';
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
            name: 'basic',
            action: () => clicked(BasicExample()),
          ),
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
          MenuButton(
            name: 'navigation basic',
            action: () => clicked(NavigationBasicExample()),
          ),
          MenuButton(
            name: 'animation',
            action: () => clicked(AnimationExample()),
          ),
          MenuButton(
            name: 'tabs',
            action: () => clicked(TabsExample()),
          ),
          MenuButton(
            name: 'bread',
            action: () => clicked(AnimationPackageExample()),
          ),
          MenuButton(
            name: 'slivers',
            action: () => clicked(SliversExample()),
          ),
          MenuButton(
            name: 'debug',
            action: () => clicked(Debug()),
          ),
          MenuButton(
            name: 'future listview',
            action: () => clicked(ListViewFutureExample()),
          ),
          MenuButton(
            name: 'gridview / gesture',
            action: () => clicked(GridExample()),
          ),
          MenuButton(
            name: 'gridview / model',
            action: () => clicked(GridviewModelExample()),
          ),
          MenuButton(
            name: 'custom painter',
            action: () => clicked(CustomPainterExample()),
          ),
          MenuButton(
            name: 'animated custom painter',
            action: () => clicked(CustomPainterAnimatedExample()),
          ),
          MenuButton(
            name: 'placeholder1',
            action: () => clicked(StatelessExample()),
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
