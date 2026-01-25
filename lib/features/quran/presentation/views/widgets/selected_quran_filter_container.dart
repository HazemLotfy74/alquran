import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SelectedQuranFilterContainer extends StatelessWidget {
  const SelectedQuranFilterContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
