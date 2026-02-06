import 'package:alquran/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/surah_entity.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<SurahEntity>>> getSurahs();
}
