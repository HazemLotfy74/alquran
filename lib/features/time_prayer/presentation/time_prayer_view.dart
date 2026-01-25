import 'package:alquran/features/time_prayer/presentation/views/time_prayer_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/prayer_times_cubit.dart';

class TimePrayerView extends StatelessWidget {
  const TimePrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrayerTimesCubit()..loadPrayerTimes(),
      child: Scaffold(body: TimePrayerBody()),
    );
  }
}
