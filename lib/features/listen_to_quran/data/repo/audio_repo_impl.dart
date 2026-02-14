import 'package:alquran/core/errors/failure.dart';
import 'package:alquran/core/services/api_service.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_repo.dart';
import 'package:dartz/dartz.dart';

class AudioRepoImpl extends AudioRepo {
  AudioRepoImpl({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<Failure, String>> getAudio({
    required int surahNumber,
    required int reciterID,
  }) async {
    try {
      final res = await apiService.getAudio(
        surahNumber: surahNumber,
        reciterID: reciterID,
      );

      return Right(res['audio_file']['audio_url']);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
