import 'package:hive/hive.dart';

part 'ayah_entity.g.dart';

@HiveType(typeId: 1)
class AyahEntity {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final int numberInSurah;
  @HiveField(3)
  final int juz;
  @HiveField(4)
  final int manzil;
  @HiveField(5)
  final int page;
  @HiveField(6)
  final int ruku;
  @HiveField(7)
  final int hizbQuarter;
  @HiveField(8)
  final dynamic sajda;

  AyahEntity({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });
}
