import 'package:equatable/equatable.dart';
import '../../domain/entities/prayer_time_entity.dart';

abstract class PrayerTimesState extends Equatable {
  const PrayerTimesState();

  @override
  List<Object?> get props => [];
}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesError extends PrayerTimesState {
  final String message;

  const PrayerTimesError(this.message);
}

class PrayerTimesLoaded extends PrayerTimesState {
  final List<PrayerTimeEntity> prayers;
  final PrayerTimeEntity currentPrayer;

  const PrayerTimesLoaded({required this.prayers, required this.currentPrayer});

  @override
  List<Object?> get props => [prayers, currentPrayer];
}
