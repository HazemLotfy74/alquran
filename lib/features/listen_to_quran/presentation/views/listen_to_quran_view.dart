import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/services/audio_service.dart';
import 'package:alquran/core/services/get_it_service.dart';
import 'package:alquran/core/services/permissions_services.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_local_repo.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_repo.dart';
import 'package:alquran/features/listen_to_quran/presentation/manager/audio_cubit.dart';
import 'package:alquran/features/listen_to_quran/presentation/manager/download_cubit.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/listen_to_quran_view_body.dart';
import 'package:alquran/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../shared/widgets/custom_app_bar.dart';
import 'download_circular_progress.dart';

class ListenToQuranView extends StatelessWidget {
  const ListenToQuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AudioCubit(
            audioRepo: getIt.get<AudioRepo>(),
            audioService: AudioService(),
            quranCubit: context.read<QuranCubit>(),
          ),
        ),
        BlocProvider(
          create: (context) => DownloadCubit(
            permissionsServices: getIt.get<PermissionsServices>(),
            audioLocalRepo: getIt.get<AudioLocalRepo>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'Listen To Quran'.tr),
        body: MultiBlocListener(
          listeners: [
            BlocListener<AudioCubit, AudioState>(
              listener: (context, state) {
                if (state is AudioFailed) {
                  customSnackBar(context, message: 'Audio failed');
                }
              },
            ),
            BlocListener<DownloadCubit, DownloadState>(
              listener: (context, state) {
                if (state is DownloadFailed) {
                  customSnackBar(context, message: state.errMsg);
                }
              },
            ),
          ],
          child: Stack(
            children: [
              const ListenToQuranViewBody(),
              BlocBuilder<DownloadCubit, DownloadState>(
                builder: (context, state) {
                  if (state is Downloading) {
                    return DownloadCircularProgress(progress: state.progress);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
