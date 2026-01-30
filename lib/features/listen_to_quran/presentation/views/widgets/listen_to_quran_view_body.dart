import 'package:alquran/features/listen_to_quran/presentation/views/widgets/custom_bottom_sheet.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/custom_slider_widget.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';

import 'audio_controls.dart';

class ListenToQuranViewBody extends StatelessWidget {
  const ListenToQuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              Assets.imagesListening,
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          CustomSliderWidget(),
          SizedBox(height: 10),
          AudioControls(),
          Spacer(),
          CustomBottomSheet(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
