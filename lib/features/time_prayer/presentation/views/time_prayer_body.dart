import 'package:alquran/features/time_prayer/presentation/views/widgets/current_prayer_card.dart';
import 'package:alquran/features/time_prayer/presentation/views/widgets/prayer_header.dart';
import 'package:alquran/features/time_prayer/presentation/views/widgets/prayer_times_list.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/prayer_times_cubit.dart';
import '../cubit/prayer_times_state.dart';

class TimePrayerBody extends StatelessWidget {
  const TimePrayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Image.asset(
            Assets.imagesBackground2,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
              builder: (context, state) {
                if (state is PrayerTimesLoaded) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        PrayerHeader(currentPrayer: state.currentPrayer),
                        const SizedBox(height: 16),
                        CurrentPrayerCard(prayer: state.currentPrayer),
                        const SizedBox(height: 16),
                        PrayerTimesList(
                          prayers: state.prayers,
                          currentPrayer: state.currentPrayer,
                        ),
                      ],
                    ),
                  );
                }

                if (state is PrayerTimesError) {
                  return Center(
                    child: Text(state.message, textAlign: TextAlign.center),
                  );
                }

                // Loading / initial
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
