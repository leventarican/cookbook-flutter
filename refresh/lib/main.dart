import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:refresh/examples/json_rest_example.dart';
import 'package:refresh/examples/navigation_example.dart';
import 'package:refresh/examples/row_column_example.dart';
import 'package:refresh/examples/simple_example.dart';

import './pages/start_page.dart';
import './pages/programminglanguage_page.dart';

import 'examples/list_view_example.dart';
import 'template/template.dart';

// hot reload may not work when switching example. thus run always app again.
void main() => runApp(ListViewExample());
//void main() => runApp(NavigationExample());
//void main() => runApp(SimpleExample());
//void main() => runApp(JsonRestExample());
//void main() => runApp(Template());
//void main() => runApp(RowColumnExample());

// #############################################################################
// # ProgrammingLanguagePage a more sophisticated way
// based on: https://www.youtube.com/watch?v=jBBl1tYkUnE
// MaterialApp has home property: will be our start page.
//main() => runApp(MaterialApp(
//      home: ProgrammingLanguagePage(),
//    ));
