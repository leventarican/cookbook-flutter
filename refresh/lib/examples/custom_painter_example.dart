import 'package:flutter/material.dart';

class CustomPainterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('custom painter'),
        ),
        body: CustomPaint(
          painter: ExamplePainter(),
          child: Container(),
        ),
      ),
    );
  }
}

class ExamplePainter extends CustomPainter {

  // on repaint
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = Colors.lime
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.butt;

    var start = Offset(0, size.height / 2);
    var end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  // on new class instance
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
