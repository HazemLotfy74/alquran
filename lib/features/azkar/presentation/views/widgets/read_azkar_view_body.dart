import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/features/azkar/domain/entities/azkar_entity.dart';
import 'package:alquran/features/azkar/presentation/views/widgets/azkar_counter_widget.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';

class ReadAzkarViewBody extends StatefulWidget {
  const ReadAzkarViewBody({super.key, required this.azkar});
  final AzkarTypeEntity azkar;

  @override
  State<ReadAzkarViewBody> createState() => _ReadAzkarViewBodyState();
}

class _ReadAzkarViewBodyState extends State<ReadAzkarViewBody> {
  int currentIndex = 0;

  final PageController pageController = PageController();

  final int totalAzkar = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: widget.azkar.totalNumber,
            controller: pageController,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      Assets.imagesBackground2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'استغفر الله العظيم',
                            style: AppTextStyle.semiBold18,
                          ),
                          Text(
                            'استغفر الله العظيم',
                            style: AppTextStyle.semiBold18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        AzkarCounterWidget(
          pageController: pageController,
          currentIndex: currentIndex,
          totalZekr: totalAzkar,
        ),
      ],
    );
  }
}
