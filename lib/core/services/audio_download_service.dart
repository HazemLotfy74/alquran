import 'dart:developer';

import 'package:alquran/core/errors/exception.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';

class AudioDownloadService {
  final Dio dio;
  final MediaStore mediaStore;
  AudioDownloadService({required this.dio, required this.mediaStore});

  Future<String?> downloadAudio({
    required String url,
    required String fileName,
    required String reciterName,
    Function(int, int)? onProgress,
  }) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final tempPath = "${tempDir.path}/$fileName.mp3";

      await dio.download(url, tempPath, onReceiveProgress: onProgress);

      await mediaStore.saveFile(
        dirType: DirType.download,
        dirName: DirName.download,
        relativePath: reciterName,
        tempFilePath: tempPath,
      );

      // ✅ لو رجع null نتحقق هل الملف موجود
      final exists = await isExist(
        fileName: fileName,
        reciterName: reciterName,
      );

      if (!exists) {
        throw Exception("File not found after save");
      }

      return fileName;
    } catch (e, stackTrace) {
      log("DOWNLOAD ERROR: $e");
      log("STACK: $stackTrace");

      // 🔥 أهم نقطة: نتحقق لو الملف موجود فعلاً
      final exists = await isExist(
        fileName: fileName,
        reciterName: reciterName,
      );

      if (exists) {
        return fileName; // نعتبره نجاح
      }

      throw CustomException(message: 'Download failed'.tr);
    }
  }

  Future<bool> isExist({
    required String fileName,
    required String reciterName,
  }) async {
    final files = await mediaStore.isFileExist(
      relativePath: reciterName,
      dirType: DirType.download,
      fileName: "$fileName.mp3",
      dirName: DirName.download,
    );

    return files;
  }

  Future<String> getPath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/$fileName.mp3";
  }
}
