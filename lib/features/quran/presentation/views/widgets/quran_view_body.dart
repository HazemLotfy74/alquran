import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/functions/dummy_data.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_filter_widget.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_surah_sliver_list.dart';
import 'package:alquran/features/quran/presentation/views/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../shared/widgets/search_text_field.dart';

class QuranViewBody extends StatelessWidget {
  QuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                const SizedBox(height: 2),
                const ScreenHeader(),
                SearchTextField(
                  onChanged: (value) {
                    context.read<QuranCubit>().search(value);
                  },
                ),
                QuranFilterWidget(filterTxt: filterTxt),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            if (state is QuranLoading) {
              return Skeletonizer.sliver(
                child: QuranSurahSliverList(surahs: [getDummyData()]),
              );
            }
            if (state is QuranFailed) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.error.tr)),
              );
            }
            if (state is QuranSuccess) {
              final cubit = context.read<QuranCubit>();
              final list = cubit.showFavorites
                  ? cubit.favoriteSurahs
                  : state.surahs;
              return QuranSurahSliverList(surahs: list);
            }
            return SliverToBoxAdapter(
              child: Center(child: Text('Something went wrong'.tr)),
            );
          },
        ),
      ],
    );
  }

  final List<String> filterTxt = ['سورة', 'المفضلة'];
}
