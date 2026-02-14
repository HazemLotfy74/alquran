import 'package:alquran/core/services/permissions_services.dart';
import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_local_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit({
    required this.permissionsServices,
    required this.audioLocalRepo,
  }) : super(DownloadInitial());
  final AudioLocalRepo audioLocalRepo;
  final PermissionsServices permissionsServices;

  Future<void> downloadAudio({
    required String url,
    required String fileName,
    required String reciterName,
  }) async {
    final hasPermission = await permissionsServices.requestStoragePermission();
    if (!hasPermission) {
      emit(DownloadFailed(errMsg: "يجب السماح بالوصول للتخزين"));
      return;
    }
    emit(Downloading(progress: 0, total: 0));
    final res = await audioLocalRepo.downloadAudio(
      url: url,
      fileName: fileName,
      onProgress: (rec, total) {
        if (total != 0) {
          final progress = rec / total;

          emit(Downloading(progress: progress, total: total));
        }
      },
      reciterName: reciterName,
    );
    res.fold(
      (fail) {
        emit(DownloadFailed(errMsg: fail.message));
      },
      (url) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Audio downloaded successfully'.tr,
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.primaryColor,
          ),
        );
        emit(DownloadInitial());
      },
    );
  }

  Future<void> checkIfDownloaded({
    required String fileName,
    required String reciterName,
  }) async {
    final exists = await audioLocalRepo.isExist(
      fileName: fileName,
      reciterName: reciterName,
    );
    if (exists) {
      emit(DownloadSuccess(fileName: fileName));
    }
  }
}
