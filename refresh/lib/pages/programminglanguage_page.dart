import 'package:flutter/material.dart';

import '../repository/programming_languages.dart';
import '../repository/programming_language.dart';
import '../controller/action_button.dart';

class ProgrammingLanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProgrammingLanguagePageState();
  }
}

class ProgrammingLanguagePageState extends State<ProgrammingLanguagePage> {
  @override
  Widget build(BuildContext context) {
    // stack laying widget on top of each other. self explaining.
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new ActionButton(true, () => print('button 0')),
            new ActionButton(false, () => print('button 1'))
          ],
        )
      ],
    );
  }
}
