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

// D:/Learning/Flutter Projects/alquran/lib/features/listen_to_quran/presentation/views/widgets/listen_to_quran_view_body.dart

class _ListenToQuranViewBodyState extends State<ListenToQuranViewBody> {
  final ValueNotifier<int> reciterID = ValueNotifier(2);
  final ValueNotifier<String> reciterName = ValueNotifier(
    'عبد الباسط عبد الصمد',
  );

  @override
  void dispose() {
    reciterID.dispose();
    reciterName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomDropDownMenuButton(
                  reciterId: (value) => reciterID.value = value,
                  reciterName: (value) => reciterName.value = value,
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    Assets.listening,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomSliderWidget(),
                const SizedBox(height: 10),
                // Optimized: Only build AudioControls when reciter or surah changes
                ValueListenableBuilder(
                  valueListenable: reciterID,
                  builder: (context, id, _) {
                    return ValueListenableBuilder(
                      valueListenable: reciterName,
                      builder: (context, name, _) {
                        return BlocBuilder<QuranCubit, QuranState>(
                          buildWhen: (previous, current) =>
                              context.read<QuranCubit>().selectedSurah != null,
                          builder: (context, state) {
                            final surah = context
                                .read<QuranCubit>()
                                .selectedSurah;
                            return AudioControls(
                              surahNumber: surah?.number ?? 1,
                              reciterID: id,
                              surahName: surah?.name ?? '',
                              reciterName: name,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                const Spacer(),
                BlocBuilder<QuranCubit, QuranState>(
                  buildWhen: (prev, curr) =>
                      curr is! QuranLoading, // Example condition
                  builder: (context, state) {
                    final surahs = context.read<QuranCubit>().surahs;
                    return CustomBottomSheet(surah: surahs);
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
