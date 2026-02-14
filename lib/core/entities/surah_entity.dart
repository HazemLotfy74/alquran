import 'package:alquran/core/entities/ayah_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../core/enums/revelation_type.dart';

part 'surah_entity.g.dart';

@HiveType(typeId: 0)
class SurahEntity extends Equatable {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String englishName;
  @HiveField(3)
  final String englishNameTranslation;
  @HiveField(4)
  final RevelationType revelationType;
  @HiveField(5)
  final List<AyahEntity> ayahs;

  const SurahEntity({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  @override
  List<Object?> get props => [number];
}
