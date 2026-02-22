import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:alquran/core/cubits/location_cubit/location_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/prayer_time_entity.dart';
import 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  final LocationCubit locationCubit;
  late final StreamSubscription locationSub;

  PrayerTimesCubit(this.locationCubit) : super(PrayerTimesInitial()) {
    locationSub = locationCubit.stream.listen((state) {
      if (state is LocationSuccess) {
        loadPrayerTimes();
      }
    });
  }

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimesLoading());

    final loc = (locationCubit.state as LocationSuccess).locationEntity;

    final coordinates = Coordinates(loc.latitude!, loc.longitude!);

    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;

    final prayerTimes = PrayerTimes(
      coordinates,
      DateComponents.from(DateTime.now()),
      params,
    );

    final prayers = [
      PrayerTimeEntity(name: "الفجر", time: prayerTimes.fajr),
      PrayerTimeEntity(name: "الشروق", time: prayerTimes.sunrise),
      PrayerTimeEntity(name: "الظهر", time: prayerTimes.dhuhr),
      PrayerTimeEntity(name: "العصر", time: prayerTimes.asr),
      PrayerTimeEntity(name: "المغرب", time: prayerTimes.maghrib),
      PrayerTimeEntity(name: "العشاء", time: prayerTimes.isha),
    ];

    final now = DateTime.now();
    PrayerTimeEntity currentPrayer = prayers.first;

    for (int i = 0; i < prayers.length; i++) {
      if (now.isBefore(prayers[i].time)) {
        currentPrayer = prayers[i == 0 ? 0 : i - 1];
        break;
      }
    }

    emit(PrayerTimesLoaded(prayers: prayers, currentPrayer: currentPrayer));
  }

  @override
  Future<void> close() {
    locationSub.cancel();
    return super.close();
  }
}
