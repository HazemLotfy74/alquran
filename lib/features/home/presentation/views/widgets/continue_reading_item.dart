import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/features/quran/data/models/last_read_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/assets.dart';

class ContinueReadingItem extends StatelessWidget {
  const ContinueReadingItem({super.key, required this.lastRead});

  final LastReadModel? lastRead;

  @override
  Widget build(BuildContext context) {
    return lastRead != null
        ? ListTile(
            leading: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      lastRead!.surahEntity.number.toString(),
                      style: AppTextStyle.medium14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(Assets.imagesSurahNumberWhite),
              ],
            ),
            title: Text(
              lastRead!.surahEntity.name,
              style: AppTextStyle.bold15.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              'آية رقم: ${lastRead!.ayahNumber}',
              style: AppTextStyle.regular13.copyWith(color: Colors.white),
            ),
            trailing: Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Continue Reading'.tr,
                  style: AppTextStyle.medium15.copyWith(color: Colors.white),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouter.readQuran,
                arguments: lastRead!.surahEntity,
              );
            },
          )
        : const SizedBox();
  }
}
