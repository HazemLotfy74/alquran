part of 'quran_cubit.dart';

sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class QuranLoading extends QuranState {}

final class SaveLastReadSurah extends QuranState {}

final class QuranSuccess extends QuranState {
  final List<SurahEntity> surahs;
  QuranSuccess({required this.surahs});
}

final class QuranFailed extends QuranState {
  final String error;
  QuranFailed({required this.error});
}
