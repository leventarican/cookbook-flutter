import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

const _image = 'assets/images/bread0.jpg';

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  Color _color;

  @override
  void initState() {
    super.initState();

    _color = Colors.grey.shade400;

    Timer.periodic(Duration(seconds: 3), (_) {
      if (mounted) {
        setState(() {
          _color = Colors.grey.shade400;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100.0,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _color = Colors.amber.shade200;
              });
            },
            child: Container(
              margin: EdgeInsets.all(16.0),
              color: _color,
              height: 200.0,
            ),
          )
        ],
      ),
    );
  }
}

class AnimationControllerExample extends StatefulWidget {
  @override
  _AnimationControllerExampleState createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      lowerBound: 0,
      upperBound: 3,
      duration: const Duration(seconds: 1),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          debugPrint('animation done.');
          // controller.repeat();
          controller.reverse();
        }
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(
      controller: controller,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    debugPrint('progress: ${_progress.value}');
    return Container(
        color: Colors.amber[50],
        child: Center(
            child: Container(
          color: Colors.blueGrey[300],
          child: SizedBox(
            height: 100.0 * _progress.value,
            width: 50.0,
          ),
        )));
  }
}
