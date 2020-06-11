import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(TemplateStateless());
}

class TemplateStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[50],
        child: Center(
            child: Container(
          color: Colors.blueGrey[300],
          child: SizedBox(
            height: 50.0,
            width: 50.0,
          ),
        )));
  }
}
