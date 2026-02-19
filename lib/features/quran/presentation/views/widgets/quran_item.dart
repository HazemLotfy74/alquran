import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/entities/surah_entity.dart';

class QuranItem extends StatelessWidget {
  const QuranItem({super.key, required this.surah});
  final SurahEntity surah;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.readQuran, arguments: surah);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        child: ListTile(
          leading: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    surah.number.toString(),
                    style: AppTextStyle.medium14,
                  ),
                ),
              ),
              SvgPicture.asset(Assets.imagesSurahNumberGreen),
            ],
          ),
          title: Text(surah.name, style: AppTextStyle.bold15),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'عدد الايات : ${surah.ayahs.length}',
                style: AppTextStyle.regular13.copyWith(
                  color: AppColors.greyColor3,
                ),
              ),
              Text(
                surah.revelationType.name.tr,
                style: AppTextStyle.regular13.copyWith(
                  color: AppColors.greyColor2,
                ),
              ),
            ],
          ),
          trailing: Text(
            surah.englishName,
            style: AppTextStyle.bold15.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
