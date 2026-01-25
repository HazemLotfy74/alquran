import 'package:flutter/material.dart';

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
          colors: [Color(0xFF2BB673), Color(0xFF1FA37A)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _formatTime(context, prayer.time),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            prayer.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(BuildContext context, DateTime time) {
    return TimeOfDay.fromDateTime(time).format(context);
  }
}
