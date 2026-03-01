import 'package:alquran/features/quran/presentation/views/widgets/custom_button.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_text_widget.dart';
import 'package:alquran/shared/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/entities/surah_entity.dart';
import '../../../../../generated/assets.dart';

class ReadQuranViewBody extends StatefulWidget {
  const ReadQuranViewBody({super.key, required this.surahEntity});
  final SurahEntity surahEntity;
  @override
  State<ReadQuranViewBody> createState() => _ReadQuranViewBodyState();
}

class _ReadQuranViewBodyState extends State<ReadQuranViewBody> {
  final ValueNotifier<double> fontSize = ValueNotifier<double>(16);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBackgroundWidget(),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              QuranTextWidget(
                fontSizeChanged: fontSize,
                ayah: widget.surahEntity.ayahs,
                surahEntity: widget.surahEntity,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  CustomButton(
                    txt: 'Zoom In'.tr,
                    image: Assets.searchZoomIn,
                    onTap: () {
                      fontSize.value += 2;
                    },
                  ),
                  CustomButton(
                    txt: 'Zoom Out'.tr,
                    image: Assets.searchZoomOut,
                    onTap: () {
                      fontSize.value -= 2;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
