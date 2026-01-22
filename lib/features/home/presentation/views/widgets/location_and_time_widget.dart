import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class LocationAndTimeWidget extends StatelessWidget {
  const LocationAndTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 15,
        children: [
          Center(
            child: Text(
              'اقرأ',
              style: AppTextStyle.bold64.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('المطرية', style: AppTextStyle.bold15),
              Icon(Icons.location_on_sharp, color: AppColors.primaryColor),
            ],
          ),
          Text(
            '10:00 AM',
            style: AppTextStyle.bold15.copyWith(color: AppColors.greyColor2),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
