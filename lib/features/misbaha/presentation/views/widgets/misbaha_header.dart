import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class MisbahaHeader extends StatelessWidget {
  const MisbahaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "مسبحة",
          style: AppTextStyle.bold20.copyWith(color: AppColors.titleColor ,fontSize:30 ),
        ),
      ],
    );
  }
}
