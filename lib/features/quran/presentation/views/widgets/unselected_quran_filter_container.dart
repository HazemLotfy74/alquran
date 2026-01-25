import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class UnselectedQuranFilterContainer extends StatelessWidget {
  const UnselectedQuranFilterContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Text(
        text,
        style: AppTextStyle.semiBold16.copyWith(
          color: AppColors.lightGreenColor,
        ),
      ),
    );
  }
}
