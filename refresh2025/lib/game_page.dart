import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  double bowPullback = 0;
  static const double arrowSpeed = 10.0;
  Offset arrowPosition = const Offset(200, 200);
  bool reset = false;

  Offset aimDirection = const Offset(1, 0);
  Offset dragStartPoint = const Offset(0, 0);
  bool isDragging = false;
  bool isShooting = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    const duration = Duration(milliseconds: 16);

    _timer = Timer.periodic(duration, (timer) {
      _updateArrowPosition();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void onPointerDown(PointerDownEvent details) {
    dragStartPoint = details.localPosition;
    setState(() {
      isDragging = true;
      aimDirection = _calculateAimDirection(details.localPosition);
    });
  }

  void onPointerMove(PointerMoveEvent details) {
    setState(() {
      aimDirection = _calculateAimDirection(details.localPosition);
      bowPullback = _calculatePower(details.localPosition);
    });
  }

  void onPointerUp(PointerUpEvent details) {
    startArrowShot();
    setState(() {
      isDragging = false;
    });
  }

  void _updateArrowPosition() {
    if (isShooting) {
      setState(() {
        if (reset) {
          reset = false;
          isShooting = false;
          bowPullback = 0;
          return;
        }
        arrowPosition += aimDirection * (bowPullback / 10);

        // check if out of the visible area
        if (arrowPosition.dx > 400 ||
            arrowPosition.dx < 0 ||
            arrowPosition.dy > 400 ||
            arrowPosition.dy < 0) {
          reset = true;
        }
      });
    }
  }

  void startArrowShot() {
    isShooting = true;
    arrowPosition = const Offset(200, 200);
    aimDirection = -aimDirection;
  }

  Offset _calculateAimDirection(Offset touchPosition) {
    double dx = touchPosition.dx - 200; // Center
    double dy = touchPosition.dy - 200; // Center
    double distance = math.sqrt(dx * dx + dy * dy);
    return Offset(dx / distance, dy / distance);
  }

  double _calculatePower(Offset touchPosition) {
    double dx = touchPosition.dx - dragStartPoint.dx;
    double dy = touchPosition.dy - dragStartPoint.dy;
    double distance = math.sqrt(dx * dx + dy * dy);
    return math.min(distance, 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bow Game')),
      body: Listener(
        onPointerDown: onPointerDown,
        onPointerMove: onPointerMove,
        onPointerUp: onPointerUp,
        child: Center(
          child: SizedBox(
            width: 400,
            height: 400,
            child: CustomPaint(
              painter: GamePainter(
                bowPullback,
                aimDirection,
                isDragging,
                arrowPosition,
                reset,
                isShooting,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GamePainter extends CustomPainter {
  final double bowPullback;
  final Offset aimDirection;
  final bool isDragging;
  final Offset arrowPosition;
  final bool reset;
  final bool isShooting;

  GamePainter(
    this.bowPullback,
    this.aimDirection,
    this.isDragging,
    this.arrowPosition,
    this.reset,
    this.isShooting,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    Offset drawArrowPosition;
    if (isDragging) {
      drawArrowPosition = center + -aimDirection * 50;
    } else {
      drawArrowPosition = arrowPosition;
    }

    // Draw the arrow only if it's being aimed or shot
    if (isDragging || isShooting) {
      // Arrow body
      final arrowPaint = Paint()..color = Colors.black;
      Offset arrowEnd = drawArrowPosition + aimDirection * 50;
      canvas.drawLine(drawArrowPosition, arrowEnd, arrowPaint);

      // Arrowhead
      final arrowheadPaint = Paint()..color = Colors.red;
      final arrowHeadBase1 =
          arrowEnd + rotateOffset(aimDirection, math.pi / 6) * 10;
      final arrowHeadBase2 =
          arrowEnd + rotateOffset(aimDirection, -math.pi / 6) * 10;
      final path = Path();
      path.moveTo(arrowEnd.dx, arrowEnd.dy);
      path.lineTo(arrowHeadBase1.dx, arrowHeadBase1.dy);
      path.lineTo(arrowHeadBase2.dx, arrowHeadBase2.dy);
      path.close();
      canvas.drawPath(path, arrowheadPaint);
    }

    // Draw power indicator
    if (isDragging) {
      final powerIndicatorPaint =
          Paint()
            ..color = Colors.blue.withOpacity(0.5)
            ..strokeWidth = 5
            ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, bowPullback, powerIndicatorPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Offset rotateOffset(Offset offset, double angle) {
  double newX = offset.dx * math.cos(angle) - offset.dy * math.sin(angle);
  double newY = offset.dx * math.sin(angle) + offset.dy * math.cos(angle);
  return Offset(newX, newY);
}
