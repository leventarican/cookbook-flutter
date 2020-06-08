import 'package:flutter/material.dart';

class InheritedWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgrammingLanguageWidget(
        lang: 'dart',
        child: ProgrammingLanguageTextWidget(),
      ),
    );
  }
}

/// this widget has the data
/// whenever data / state is changing the consumers are triggered to re-build.
class ProgrammingLanguageWidget extends InheritedWidget {
  final String lang;

  const ProgrammingLanguageWidget(
      {Key key, @required this.lang, @required Widget child})
      : assert(lang != null),
        assert(child != null),
        super(key: key, child: child);

  // determines when the nearest consumer should be notified.
  static String of(BuildContext context) {
    final ProgrammingLanguageWidget pl = context.dependOnInheritedWidgetOfExactType();
    return pl.lang;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

// get the data from the tree (= InheritedWidget)
class ProgrammingLanguageTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Programming Language: ${ProgrammingLanguageWidget.of(context)}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
