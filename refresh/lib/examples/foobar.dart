import 'package:flutter/material.dart';
import 'dart:math' as math;

num radians(num deg) => deg * (math.pi / 180.0);

/// 
/// under development
/// 
/// passing state down
/// lifting state up is not possible. instead we call the function: dont call me i will call you.
/// 
class Foobar extends StatefulWidget {
  @override
  _FoobarState createState() => _FoobarState();
}

class _FoobarState extends State<Foobar> {
  double _deg = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('foobar'),
      ),
      body: Container(
          child: Column(
        children: [
          Rect(
            color: Colors.lightGreen.shade300,
            size: 200.0,
            deg: _deg,
          ),
          ValueChanger(
            value: 0,
            onChanged: _setDeg,
          ),
        ],
      )),
    );
  }

  void _setDeg(int value) {
    setState(() {
      _deg = value.toDouble();
    });
  }
}

class Rect extends StatelessWidget {
  final Color color;
  final double size;
  final double deg;
  Rect({@required this.color, this.size = 50, @required this.deg});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16.0),
        width: size,
        height: size,
        transform: Matrix4.rotationY(radians(deg)),
        decoration: BoxDecoration(color: color, shape: BoxShape.rectangle));
  }
}

class ValueChanger extends StatefulWidget {
  final Function onChanged;
  final int value;

  // Value passed in from its host
  ValueChanger({Key key, this.value = 0, this.onChanged}) : super(key: key);

  @override
  _ValueChangerState createState() => _ValueChangerState();
}

class _ValueChangerState extends State<ValueChanger> {
  int _value;

  @override
  Widget build(BuildContext context) {
    
    _value = widget.value;

    return Container(
      child: Column(
        children: <Widget>[
          Text('deg'),
          Slider(
            min: 0,
            max: 360,
            value: _value?.toDouble(),
            label: 'deg',
            onChanged: _onChanged,
          )
        ],
      ),
    );
  }

  _onChanged(double value) {
    debugPrint('$value');
    setState(() {
      this._value = value.round();
    });
    widget.onChanged(value.round());
  }
}
