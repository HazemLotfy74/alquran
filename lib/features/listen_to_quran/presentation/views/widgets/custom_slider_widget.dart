import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../manager/audio_cubit.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        final position = state.position.inSeconds.toDouble();
        final duration = state.total.inSeconds.toDouble();
        final cubit = context.read<AudioCubit>();
        return Column(
          children: [
            Slider(
              min: 0,
              max: duration > 0 ? duration : 1,
              value: position.clamp(0, duration),
              onChanged: (value) {
                cubit.audioService.seek(Duration(seconds: value.toInt()));
                cubit.resumeAudio();
              },
              activeColor: AppColors.primaryColor,
              inactiveColor: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    _format(state.position),
                    style: AppTextStyle.semiBold12.copyWith(
                      color: AppColors.lightGreenColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _format(state.total),
                    style: AppTextStyle.semiBold12.copyWith(
                      color: AppColors.lightGreenColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _format(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
  }
}
