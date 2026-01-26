import 'package:flutter/material.dart';

import '../../../domain/entities/prayer_time_entity.dart';
import 'prayer_time_item.dart';

class PrayerTimesList extends StatelessWidget {
  final List<PrayerTimeEntity> prayers;
  final PrayerTimeEntity currentPrayer;

  const PrayerTimesList({
    super.key,
    required this.prayers,
    required this.currentPrayer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: prayers.map((prayer) {
        return PrayerTimeItem(
          name: prayer.name,
          time: _formatTime(context, prayer.time),
          isActive: prayer.name == currentPrayer.name,
        );
      }).toList(),
    );
  }

  String _formatTime(BuildContext context, DateTime time) {
    return TimeOfDay.fromDateTime(time).format(context);
  }
}
