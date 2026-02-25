import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/features/listen_to_quran/presentation/manager/download_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/quran_cubit/quran_cubit.dart';
import '../../manager/audio_cubit.dart';

class AudioControls extends StatefulWidget {
  const AudioControls({
    super.key,
    required this.surahNumber,
    required this.reciterID,
    required this.surahName,
    required this.reciterName,
  });

  final int surahNumber;
  final String surahName;
  final String reciterName;
  final int reciterID;

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  @override
  void initState() {
    context.read<DownloadCubit>().checkIfDownloaded(
      fileName:
          '${widget.surahName}(${widget.surahNumber})-${widget.reciterName}(${widget.reciterID})',
      reciterName: widget.reciterName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        final cubit = context.read<AudioCubit>();
        final quranCubit = context.read<QuranCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                cubit.toggleRepeat();
              },
              child: Icon(
                state.isRepeat ? Icons.repeat_one : Icons.repeat,
                color: state.isRepeat
                    ? AppColors.primaryColor
                    : AppColors.arrowColor,
              ),
            ),
            Row(
              spacing: 15,
              children: [
                IconButton(
                  onPressed: () async {
                    final next = quranCubit.nextSurah;
                    if (next == null) return;
                    quranCubit.selectSurah(next);
                    await cubit.getAudio(surahNumber: next.number);
                  },
                  icon: const Icon(
                    Icons.skip_next_rounded,
                    color: AppColors.arrowColor,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (state.isPlaying) {
                      cubit.pauseAudio();
                    } else {
                      cubit.playFromCurrent();
                    }
                  },
                  icon: Icon(
                    state.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final next = quranCubit.previousSurah;
                    if (next == null) return;
                    quranCubit.selectSurah(next);
                    await cubit.getAudio(surahNumber: next.number);
                  },
                  icon: const Icon(
                    Icons.skip_previous_rounded,
                    color: AppColors.arrowColor,
                    size: 35,
                  ),
                ),
              ],
            ),
            BlocBuilder<DownloadCubit, DownloadState>(
              builder: (context, state) {
                if (state is DownloadSuccess) {
                  return const Icon(
                    Icons.download_done,
                    color: AppColors.primaryColor,
                  );
                }

                return IconButton(
                  onPressed: () {
                    if (cubit.currentUrl != null) {
                      context.read<DownloadCubit>().downloadAudio(
                        url: cubit.currentUrl!,
                        fileName:
                            '${widget.surahName}(${widget.surahNumber})-${widget.reciterName}(${widget.reciterID})',
                        reciterName: widget.reciterName,
                      );
                    }
                    null;
                  },
                  icon: const Icon(Icons.download, color: AppColors.arrowColor),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
