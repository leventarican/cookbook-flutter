import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      lowerBound: 0,
      upperBound: 400,
      duration: const Duration(seconds: 10),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: controller.value,
      height: controller.value,
      child: Image.asset('assets/images/bread2.jpg'),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
