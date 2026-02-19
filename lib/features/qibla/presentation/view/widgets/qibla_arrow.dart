import 'package:flutter/material.dart';
import 'qibla_arrow_head.dart';

class QiblaArrow extends StatelessWidget {
  const QiblaArrow({
    super.key,
    required this.angleRadians,
  });

  final double angleRadians;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: angleRadians),
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      builder: (context, v, child) {
        return Transform.rotate(angle: v, child: child);
      },
      child: const _Needle(),
    );
  }
}

class _Needle extends StatelessWidget {
  const _Needle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const QiblaArrowHead(),
        Container(
          width: 4,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.92),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.35),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
