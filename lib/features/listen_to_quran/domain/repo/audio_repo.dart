import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AudioRepo {
  Future<Either<Failure, String>> getAudio({
    required int surahNumber,
    required int reciterID,
  });
}
