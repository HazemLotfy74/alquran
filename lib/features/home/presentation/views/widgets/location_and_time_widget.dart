import 'package:alquran/features/home/presentation/views/widgets/date_and_live_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'location_widget.dart';

class LocationAndTimeWidget extends StatefulWidget {
  const LocationAndTimeWidget({super.key});

  @override
  State<LocationAndTimeWidget> createState() => _LocationAndTimeWidgetState();
}

class _LocationAndTimeWidgetState extends State<LocationAndTimeWidget> {
  @override
  void initState() {
    super.initState();
    HijriCalendar.setLocal("ar");
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'اقرأ',
              style: AppTextStyle.bold64.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const LocationWidget(),
          const DateAndLiveTimeWidget(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
