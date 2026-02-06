import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/core/widgets/search_text_field.dart';
import 'package:alquran/features/listen_to_quran/presentation/manager/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SurahListBottomSheet extends StatelessWidget {
  const SurahListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        spacing: 16,
        children: [
          const SizedBox(height: 12),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Text('Surahs'.tr, style: AppTextStyle.semiBold16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchTextField(
              onChanged: (value) {
                context.read<QuranCubit>().search(value);
              },
            ),
          ),

          Expanded(
            child: BlocBuilder<QuranCubit, QuranState>(
              builder: (context, state) {
                if (state is QuranSuccess) {
                  final surahs = state.surahs;
                  return ListView.separated(
                    itemCount: surahs.length,
                    separatorBuilder: (_, _) =>
                        Divider(height: 1, color: Colors.grey.shade200),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          surahs[index].name,
                          style: AppTextStyle.semiBold16,
                        ),
                        subtitle: Text(
                          surahs[index].englishName,
                          style: AppTextStyle.regular13.copyWith(
                            color: AppColors.greyColor3,
                          ),
                        ),
                        trailing: Icon(
                          Icons.play_circle,
                          color: AppColors.primaryColor,
                        ),
                        onTap: () async {
                          context.read<QuranCubit>().selectSurah(surahs[index]);
                          await context.read<AudioCubit>().getAudio(
                            surahNumber: surahs[index].number,
                            recId: context.read<AudioCubit>().reciterID,
                          );
                          if (!context.mounted) {
                            return;
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }
                if (state is QuranFailed) {
                  return Center(child: Text(state.error.tr));
                }
                if (state is QuranLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Center(child: Text('Something went wrong'.tr));
              },
            ),
          ),
        ],
      ),
    );
  }
}
