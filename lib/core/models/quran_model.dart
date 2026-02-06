import 'list_of_surah_model.dart';

class QuranModel {
  int code;
  String status;
  ListOfSurahsModel data;

  QuranModel({required this.code, required this.status, required this.data});

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
    code: json["code"],
    status: json["status"],
    data: ListOfSurahsModel.fromJson(json["data"]),
  );
}

class SajdaClass {
  int id;
  bool recommended;
  bool obligatory;

  SajdaClass({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });
}
