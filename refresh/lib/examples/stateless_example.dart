import 'package:flutter/material.dart';

class StatelessExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _aspect();
  }

  Expanded _aspect() {
    return Expanded(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: SizedBox(
          child: Container(
            color: Colors.amber[100],
          ),
        ),
      ),
    ));
  }
}
