import 'package:alquran/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AudioLocalRepo {
  Future<Either<Failure, String>> downloadAudio({
    required String url,
    required String fileName,
    required String reciterName,
    Function(int, int)? onProgress,
  });
  Future<bool> isExist({required String fileName, required String reciterName});
  Future<String> getPath({required String fileName});
}
