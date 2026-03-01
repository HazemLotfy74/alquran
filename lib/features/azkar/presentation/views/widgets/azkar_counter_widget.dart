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
  });

  final PageController pageController;
  final int currentIndex;
  final int totalZekr;
  final String audioUrl;

  @override
  State<AzkarCounterWidget> createState() => _AzkarCounterWidgetState();
}

class _AzkarCounterWidgetState extends State<AzkarCounterWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.currentIndex;
  }

  @override
  void didUpdateWidget(covariant AzkarCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentIndex != widget.currentIndex) {
      counter = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                  setState(() {});
                }
                if (counter == widget.totalZekr) {
                  if (widget.audioUrl.isEmpty) return;
                  context.read<AzkarAudioCubit>().stopAudio();
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  setState(() {});
                }
              },
              shape: CircleBorder(),
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
                        if (counter > 0) {
                          counter = 0;
                          setState(() {});
                        }
                        if (widget.audioUrl.isEmpty) return;
                        context.read<AzkarAudioCubit>().stopAudio();
                        widget.pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.skip_next_outlined),
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
                        if (counter > 0) {
                          counter = 0;
                          setState(() {});
                        }
                        if (widget.audioUrl.isEmpty) return;
                        context.read<AzkarAudioCubit>().pauseAudio();
                        widget.pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: Icon(Icons.skip_previous_outlined),
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
