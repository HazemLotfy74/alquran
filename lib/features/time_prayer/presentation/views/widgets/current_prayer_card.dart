import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/entities/prayer_time_entity.dart';

class CurrentPrayerCard extends StatelessWidget {
  final PrayerTimeEntity prayer;

  const CurrentPrayerCard({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [(AppColors.primaryColor), (AppColors.boldGreenColor)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _formatTime(context, prayer.time),
            style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
          ),
          Text(
            prayer.name,
            style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  String _formatTime(BuildContext context, DateTime time) {
    return TimeOfDay.fromDateTime(time).format(context);
  }
}
