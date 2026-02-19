import 'package:flutter/material.dart';

class QiblaArrowHead extends StatelessWidget {
  const QiblaArrowHead({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(34, 34),
      painter: _ArrowHeadPainter(),
    );
  }
}

class _ArrowHeadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withValues(alpha: 0.92);

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.25), 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
