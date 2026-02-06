import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/custom_bottom_sheet.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/custom_slider_widget.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'audio_controls.dart';
import 'custom_drop_down_menu_button.dart';

class ListenToQuranViewBody extends StatefulWidget {
  const ListenToQuranViewBody({super.key});

  @override
  State<ListenToQuranViewBody> createState() => _ListenToQuranViewBodyState();
}

class _ListenToQuranViewBodyState extends State<ListenToQuranViewBody> {
  ValueNotifier<int> reciterID = ValueNotifier(2);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ValueListenableBuilder(
              valueListenable: reciterID,
              builder: (context, value, child) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    CustomDropDownMenuButton(
                      reciterId: (value) {
                        reciterID.value = value;
                      },
                    ),
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
                    BlocBuilder<QuranCubit, QuranState>(
                      builder: (context, state) {
                        final surah = context.watch<QuranCubit>().selectedSurah;
                        return AudioControls(
                          surahNumber: surah?.number ?? 1,
                          reciterID: reciterID.value,
                        );
                      },
                    ),
                    Spacer(),
                    BlocBuilder<QuranCubit, QuranState>(
                      builder: (context, state) {
                        final surah = context.read<QuranCubit>().surahs;
                        return CustomBottomSheet(surah: surah);
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
