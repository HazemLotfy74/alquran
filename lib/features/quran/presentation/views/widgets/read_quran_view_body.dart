import 'package:alquran/features/quran/domain/entities/surah_entity.dart';
import 'package:alquran/features/quran/presentation/views/widgets/custom_button.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Positioned.fill(
          child: Image.asset(Assets.imagesBackground2, fit: BoxFit.fill),
        ),
        Column(
          children: [
            SizedBox(height: 50),
            QuranTextWidget(
              fontSizeChanged: fontSize,
              ayah: widget.surahEntity.ayahs,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                CustomButton(
                  txt: 'Zoom In'.tr,
                  image: Assets.imagesSearchZoomIn,
                  onTap: () {
                    fontSize.value += 2;
                  },
                ),
                CustomButton(
                  txt: 'Zoom Out'.tr,
                  image: Assets.imagesSearchZoomOut,
                  onTap: () {
                    fontSize.value -= 2;
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
