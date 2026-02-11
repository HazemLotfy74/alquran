import 'package:adhan/adhan.dart';
import 'package:alquran/core/services/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/prayer_time_entity.dart';
import 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  final LocationService locationService;

  PrayerTimesCubit(this.locationService) : super(PrayerTimesInitial());

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimesLoading()); // create this state if you don’t have it

    // 1) permission
    final permResult = await locationService.initializeLocationPermission();

      (_) async {
    // 2) get location
    final loc = await locationService.getLocation();

    if (loc.latitude == null || loc.longitude == null) {
    emit(const PrayerTimesError('Location is null'));
    return;
    }

    // 3) coordinates
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
    };
  }
}
