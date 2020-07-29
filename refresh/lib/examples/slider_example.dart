import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Transform.rotate(
              // 2*pi (radians) = 360 (deg)
              // 3.14 radians = 180 degree
              angle: _value,
              child: Container(
                color: Colors.lightGreen.shade200,
                height: 200,
                width: 200,
                // transform: Matrix4.rotationX(_value),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Slider(
                value: _value,
                min: 0,
                max: math.pi,
                divisions: 8,
                onChanged: (newValue) {
                  setState(() {
                    _value = newValue;
                    debugPrint('value: $_value');
                  });
                })
          ],
        ),
      ),
    );
  }
}
