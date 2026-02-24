import 'package:alquran/core/errors/failure.dart';
import 'package:alquran/core/services/audio_download_service.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_local_repo.dart';
import 'package:dartz/dartz.dart';

class AudioLocalRepoImpl implements AudioLocalRepo {
  final AudioDownloadService audioDownloadService;
  const AudioLocalRepoImpl({required this.audioDownloadService});
  @override
  Future<Either<Failure, String>> downloadAudio({
    required String url,
    required String fileName,
    required String reciterName,
    Function(int, int)? onProgress,
  }) async {
    try {
      await audioDownloadService.downloadAudio(
        url: url,
        fileName: fileName,
        onProgress: onProgress,
        reciterName: reciterName,
      );

      return Right('Audio downloaded successfully');
    } catch (e) {
      return Left(DownloadFailure(e.toString()));
    }
  }

  @override
  Future<String> getPath({required String fileName}) {
    return audioDownloadService.getPath(fileName);
  }

  @override
  Future<bool> isExist({
    required String fileName,
    required String reciterName,
  }) {
    return audioDownloadService.isExist(
      fileName: fileName,
      reciterName: reciterName,
    );
  }
}
