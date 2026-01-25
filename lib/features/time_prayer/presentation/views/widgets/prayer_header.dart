import 'package:flutter/material.dart';

import '../../../domain/entities/prayer_time_entity.dart';

class PrayerHeader extends StatelessWidget {
  final PrayerTimeEntity currentPrayer;

  const PrayerHeader({
    super.key,
    required this.currentPrayer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Text(
          "مواقيت الصلاة",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("الآن موعد صلاة ${currentPrayer.name}"),
            const SizedBox(width: 6),
            const Icon(Icons.access_time, size: 18),
            const SizedBox(width: 4),
            Text(_formatTime(context, currentPrayer.time)),
          ],
        ),
      ],
    );
  }

  String _formatTime(BuildContext context, DateTime time) {
    return TimeOfDay.fromDateTime(time).format(context);
  }
}
