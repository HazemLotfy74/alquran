import 'package:alquran/core/entities/location_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class LocationSuccessWidget extends StatelessWidget {
  const LocationSuccessWidget({super.key, required this.locationEntity});
  final LocationEntity locationEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(Icons.location_on_sharp, color: AppColors.primaryColor),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: locationEntity.address ?? '',
                  style: AppTextStyle.bold15,
                ),
                const TextSpan(text: ' , '),
                TextSpan(
                  text: locationEntity.city ?? '',
                  style: AppTextStyle.bold15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
