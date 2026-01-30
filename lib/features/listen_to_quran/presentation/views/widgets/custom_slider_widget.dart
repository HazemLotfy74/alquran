import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: 50,
          onChanged: (value) {},
          activeColor: AppColors.primaryColor,
          max: 90,
          inactiveColor: Colors.grey.shade200,
        ),
        Row(
          children: [
            Text(
              '00:00',
              style: AppTextStyle.semiBold12.copyWith(
                color: AppColors.lightGreenColor,
              ),
            ),
            Spacer(),
            Text(
              '00:00',
              style: AppTextStyle.semiBold12.copyWith(
                color: AppColors.lightGreenColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
