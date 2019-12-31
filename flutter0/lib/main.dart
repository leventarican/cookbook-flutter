import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello flutter',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

void main() => runApp(App());
