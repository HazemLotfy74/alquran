import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'live_time_widget.dart';

class DateAndLiveTimeWidget extends StatelessWidget {
  const DateAndLiveTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                HijriCalendar.now().toFormat("dd MMMM yyyy هـ"),
                style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
              ),
              const LiveTimeWidget(),
            ],
          ),
          RepaintBoundary(
            child: SvgPicture.asset(
              Assets.vecteezyMuslimManPrayingAfterShalat7885406,
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
