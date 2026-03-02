import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/features/azkar/presentation/cubit/azkar_audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarCounterWidget extends StatefulWidget {
  const AzkarCounterWidget({
    super.key,
    required this.pageController,
    required this.totalZekr,
    required this.currentIndex,
    required this.audioUrl,
    required this.initialCounter,
    required this.onCounterChanged,
  });

  final PageController pageController;
  final int currentIndex;
  final int totalZekr;
  final String audioUrl;
  final int initialCounter;
  final ValueChanged<int> onCounterChanged;

  @override
  State<AzkarCounterWidget> createState() => _AzkarCounterWidgetState();
}

class _AzkarCounterWidgetState extends State<AzkarCounterWidget> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.initialCounter;
  }

  @override
  void didUpdateWidget(covariant AzkarCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentIndex != widget.currentIndex) {
      counter = widget.initialCounter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.large(
              onPressed: () {
                if (counter < widget.totalZekr) {
                  counter++;
                  widget.onCounterChanged(counter);
                  setState(() {});
                }
                if (counter == widget.totalZekr) {
                  if (widget.audioUrl.isNotEmpty) {
                    context.read<AzkarAudioCubit>().stopAudio();
                  }
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              shape: const CircleBorder(),
              backgroundColor: AppColors.primaryColor,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: counter.toString(),
                      style: AppTextStyle.semiBold18.copyWith(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                      text: '/',
                      style: AppTextStyle.medium15.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: widget.totalZekr.toString(),
                      style: AppTextStyle.medium15.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<AzkarAudioCubit, AzkarAudioState>(
              builder: (context, state) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (widget.audioUrl.isEmpty) return;
                        context.read<AzkarAudioCubit>().stopAudio();
                        widget.pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.skip_next_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        if (widget.audioUrl.isEmpty) return;
                        context.read<AzkarAudioCubit>().toggle(widget.audioUrl);
                      },
                      icon: Icon(
                        state is AzkarAudioPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 30,
                      ),
                      color: AppColors.primaryColor,
                    ),
                    IconButton(
                      onPressed: () {
                        if (widget.audioUrl.isEmpty) return;
                        context.read<AzkarAudioCubit>().pauseAudio();
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.skip_previous_outlined),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
