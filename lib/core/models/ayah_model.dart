import 'package:alquran/core/entities/ayah_entity.dart';

class Ayah {
  int number;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  String? audioUrl;
  dynamic sajda;

  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
    this.audioUrl,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
    number: json["number"],
    text: _cleanAyahText(json["text"]),
    numberInSurah: json["numberInSurah"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: json["sajda"],
    audioUrl: json["audioUrl"],
  );

  AyahEntity toAyahEntity() {
    return AyahEntity(
      number: number,
      text: text,
      numberInSurah: numberInSurah,
      juz: juz,
      manzil: manzil,
      page: page,
      ruku: ruku,
      hizbQuarter: hizbQuarter,
      sajda: sajda,
      audioUrl: audioUrl,
    );
  }

  static String _cleanAyahText(String text) {
    return text.replaceAll('\n', '').replaceAll('  ', ' ').trim();
  }
}
