import 'package:alquran/core/entities/surah_entity.dart';

class LastReadModel {
  final SurahEntity surahEntity;
  final int ayahNumber;
  final double scrollOffset;
  final double fontSize;

  const LastReadModel({
    required this.surahEntity,
    required this.ayahNumber,
    required this.scrollOffset,
    required this.fontSize,
  });
}
