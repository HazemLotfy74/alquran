import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/features/azkar/domain/entities/azkar_entity.dart';
import 'package:alquran/features/azkar/presentation/views/widgets/azkar_view_body_sliver_list.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';

class AzkarViewBody extends StatelessWidget {
  AzkarViewBody({super.key});
  final List<AzkarTypeEntity> azkarType = [
    AzkarTypeEntity(
      title: 'اذكار الصباح',
      image: Assets.imagesAzkarMorning,
      totalNumber: 21,
    ),
    AzkarTypeEntity(
      title: 'اذكار المساء',
      image: Assets.imagesAzkarNight,
      totalNumber: 21,
    ),
    AzkarTypeEntity(
      title: 'اذكار قبل النوم',
      image: Assets.imagesSleepAzkar,
      totalNumber: 12,
    ),
    AzkarTypeEntity(
      title: 'اذكار الاستيقاظ من النوم',
      image: Assets.imagesWakeAzkar,
      totalNumber: 5,
    ),
    AzkarTypeEntity(
      title: 'اذكار بعد الصلاة',
      image: Assets.imagesPrayAzkar,
      totalNumber: 7,
    ),
    AzkarTypeEntity(
      title: 'اذكار سماع الاذان',
      image: Assets.imagesMosqueSvgrepoCom,
      totalNumber: 2,
    ),
    AzkarTypeEntity(
      title: 'اذكار قبل الوضوء',
      image: Assets.imagesWodoqAzkar,
      totalNumber: 1,
    ),
    AzkarTypeEntity(
      title: 'اذكار بعد الوضوء',
      image: Assets.imagesAfterWodoqAzkar,
      totalNumber: 3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('قائمة الاذكار', style: AppTextStyle.bold15),
          ),
        ),
        AzkarViewBodySliverList(azkarType: azkarType),
      ],
    );
  }
}
