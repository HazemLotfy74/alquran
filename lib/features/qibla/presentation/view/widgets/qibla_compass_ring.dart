import 'dart:math' as math;
import 'package:flutter/material.dart';

class QiblaCompassRing extends StatelessWidget {
  const QiblaCompassRing({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(260, 260),
      painter: _CompassRingPainter(),
    );
  }
}

class _CompassRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final outer = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white.withValues(alpha: 0.25);

    canvas.drawCircle(center, size.width / 2 - 2, outer);

    final tickPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withValues(alpha: 0.35);

    for (int i = 0; i < 60; i++) {
      final isMajor = i % 5 == 0;
      final len = isMajor ? 14.0 : 7.0;

      final angle = (i * 6) * (math.pi / 180);
      final r1 = size.width / 2 - 10;
      final r2 = r1 - len;

      final p1 = center + Offset(math.cos(angle) * r1, math.sin(angle) * r1);
      final p2 = center + Offset(math.cos(angle) * r2, math.sin(angle) * r2);

      tickPaint.strokeWidth = isMajor ? 2.6 : 1.6;
      canvas.drawLine(p1, p2, tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
