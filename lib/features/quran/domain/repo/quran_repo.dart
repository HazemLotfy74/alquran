import 'package:alquran/core/errors/failure.dart';
import 'package:alquran/features/quran/domain/entities/surah_entity.dart';
import 'package:dartz/dartz.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<SurahEntity>>> getSurahs();
}
