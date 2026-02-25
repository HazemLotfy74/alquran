import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/custom_bottom_sheet_handle.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/surah_list_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/surah_entity.dart';
import '../../manager/audio_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.surah});

  final List<SurahEntity> surah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bottomSheet(context, surah: surah),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Column(
          children: [
            CustomBottomSheetHandle(),
            BlocBuilder<QuranCubit, QuranState>(
              builder: (context, state) {
                final surah = context.read<QuranCubit>().selectedSurah;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      surah?.name ?? '',
                      style: AppTextStyle.semiBold16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      surah?.englishName ?? '',
                      style: AppTextStyle.semiBold16.copyWith(
                        color: Colors.white,
                      ),
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

  void bottomSheet(BuildContext context, {required List<SurahEntity> surah}) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<QuranCubit>(),
          child: BlocProvider.value(
            value: context.read<AudioCubit>(),
            child: SurahListBottomSheet(),
          ),
        );
      },
    );
  }
}
