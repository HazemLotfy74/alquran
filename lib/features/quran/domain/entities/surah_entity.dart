import 'package:alquran/features/quran/domain/entities/ayah_entity.dart';

import '../../../../core/enums/RevelationType.dart';

class SurahEntity {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final RevelationType revelationType;
  final List<AyahEntity> ayahs;

  SurahEntity({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });
}
