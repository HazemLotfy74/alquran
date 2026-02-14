import 'package:alquran/core/models/surah_model.dart';

class ListOfSurahsModel {
  List<Surah> surahs;

  ListOfSurahsModel({required this.surahs});

  factory ListOfSurahsModel.fromJson(Map<String, dynamic> json) =>
      ListOfSurahsModel(
        surahs: List<Surah>.from(json["surahs"].map((x) => Surah.fromJson(x))),
      );
}
