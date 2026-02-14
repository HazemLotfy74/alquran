import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/assets.dart';

class ContinueReadingWidget extends StatelessWidget {
  const ContinueReadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        final lastRead = context.read<QuranCubit>().lastReadModel;

        if (lastRead == null) {
          return const SliverToBoxAdapter(child: SizedBox());
        }
        return SliverToBoxAdapter(
          child: Card(
            color: AppColors.primaryColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
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
                        lastRead.surahEntity.number.toString(),
                        style: AppTextStyle.medium14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.imagesSurahNumber,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.clear,
                    ),
                  ),
                ],
              ),
              title: Text(
                lastRead.surahEntity.name,
                style: AppTextStyle.bold15.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                'آية رقم: ${lastRead.ayahNumber}',
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
                  Icon(
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
                  arguments: lastRead.surahEntity,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
