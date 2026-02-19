import 'dart:ui';

import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/features/qibla/presentation/view/widgets/qibla_arrow.dart';
import 'package:alquran/features/qibla/presentation/view/widgets/qibla_compass_ring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/assets.dart';

class QiblaCompassCard extends StatelessWidget {
  final double angleRadians;
  final double bearingDegrees;

  const QiblaCompassCard({
    super.key,
    required this.angleRadians,
    required this.bearingDegrees,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.lightGreenColor,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Qibla Direction".tr,
                style: AppTextStyle.bold18.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 6),
              Text(
                bearingDegrees.toStringAsFixed(1),
                style: AppTextStyle.medium14.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 260,
                height: 260,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const QiblaCompassRing(),
                    Positioned(
                      top: 12,
                      child: SvgPicture.asset(
                        Assets.imageKaaba,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    QiblaArrow(angleRadians: angleRadians),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 1,
                            color: Colors.black.withValues(alpha: 0.15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
