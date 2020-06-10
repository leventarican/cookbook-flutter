import 'package:flutter/material.dart';

class StatelessExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stateless example'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}