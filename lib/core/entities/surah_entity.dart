import 'package:alquran/core/entities/ayah_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/enums/revelation_type.dart';

class SurahEntity extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final RevelationType revelationType;
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
