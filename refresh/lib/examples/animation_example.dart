import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

const _image = 'assets/images/bread0.jpg';

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  List<Color> _colors = List.filled(2, Colors.grey.shade400);
  Timer _timer;

  Timer get timer => _timer;

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      if (mounted) {
        debugPrint('mounted');
        setState(() {
          _colors = List.filled(2, Colors.grey.shade400);
        });
      } else {
        debugPrint('not mounted');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _colors[0] = Colors.amber.shade200;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              margin: EdgeInsets.all(16.0),
              color: _colors[0],
              height: 200.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _colors[1] = Colors.green.shade200;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              margin: EdgeInsets.all(16.0),
              color: _colors[1],
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

class MemoryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return null;
            }));
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
