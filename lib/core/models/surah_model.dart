import 'package:alquran/core/extension/quran_reveltation_extension.dart';

import '../../../../core/models/ayah_model.dart';
import '../entities/surah_entity.dart';
import '../enums/revelation_type.dart';

class Surah {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  RevelationType revelationType;
  List<Ayah> ayahs;

  Surah({
    required this.number,

    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    revelationType: (json["revelationType"] as String).toRevelationType(),
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
  );

  SurahEntity toSurahEntity() {
    return SurahEntity(
      number: number,
      name: name,
      englishName: englishName,
      englishNameTranslation: englishNameTranslation,
      revelationType: revelationType,
      ayahs: ayahs.map((ayah) {
        return ayah.toAyahEntity();
      }).toList(),
    );
  }
}
