
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:refresh/examples/jsonrestexample.dart';
import 'package:refresh/examples/navigationexample.dart';
import 'package:refresh/examples/simpleexample.dart';

import './pages/start_page.dart';
import './pages/programminglanguage_page.dart';

import 'examples/listviewexample.dart';
import 'template/template.dart';

// hot reload may not work when switching example. thus run always app again.
//void main() => runApp(ListViewExample());
//void main() => runApp(NavigationExample());
//void main() => runApp(SimpleExample());
void main() => runApp(JsonRestExample());
//void main() => runApp(Template());

// #############################################################################
// # ProgrammingLanguagePage a more sophisticated way
// based on: https://www.youtube.com/watch?v=jBBl1tYkUnE
// MaterialApp has home property: will be our start page.
//  home: new ProgrammingLanguagePage(),
//    ));
