import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/services/audio_service.dart';
import 'package:alquran/core/services/get_it_service.dart';
import 'package:alquran/shared/widgets/custom_app_bar.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_repo.dart';
import 'package:alquran/features/listen_to_quran/presentation/manager/audio_cubit.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/listen_to_quran_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListenToQuranView extends StatelessWidget {
  const ListenToQuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(
        audioRepo: getIt.get<AudioRepo>(),
        audioService: AudioService(),
        quranCubit: context.read<QuranCubit>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'الاستماع'),
        body: BlocConsumer<AudioCubit, AudioState>(
          listener: (context, state) {
            if (state is AudioFailed) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errMsg)));
            }
          },
          builder: (context, state) {
            return ListenToQuranViewBody();
          },
        ),
      ),
    );
  }
}
