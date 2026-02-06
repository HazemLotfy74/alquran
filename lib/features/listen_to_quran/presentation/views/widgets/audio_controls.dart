import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/cubits/quran_cubit/quran_cubit.dart';
import '../../manager/audio_cubit.dart';

class AudioControls extends StatefulWidget {
  const AudioControls({
    super.key,
    required this.surahNumber,
    required this.reciterID,
  });

  final int surahNumber;
  final int reciterID;

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  @override
  void initState() {
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
                  icon: Icon(
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
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final next = quranCubit.previousSurah;
                    if (next == null) return;
                    quranCubit.selectSurah(next);
                    await cubit.getAudio(surahNumber: next.number);
                  },
                  icon: Icon(
                    Icons.skip_previous_rounded,
                    color: AppColors.arrowColor,
                    size: 35,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(Assets.imagesSetting),
          ],
        );
      },
    );
  }
}
