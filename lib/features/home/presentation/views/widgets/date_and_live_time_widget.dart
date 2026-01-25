import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'live_time_widget.dart';

class DateAndLiveTimeWidget extends StatelessWidget {
  const DateAndLiveTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.5),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            Assets.imagesVecteezyMuslimManPrayingAfterShalat7885406,
            width: 150,
            height: 150,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                HijriCalendar.now().toFormat("dd MMMM yyyy هـ"),
                style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
              ),
              LiveTimeWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
