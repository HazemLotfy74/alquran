import 'package:alquran/core/widgets/search_text_field.dart';
import 'package:alquran/features/quran/presentation/manager/cubit/quran_cubit.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_filter_widget.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_surah_sliver_list.dart';
import 'package:alquran/features/quran/presentation/views/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                SizedBox(height: 2),
                ScreenHeader(),
                SearchTextField(),
                QuranFilterWidget(filterTxt: filterTxt),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
        BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            if (state is QuranLoading) {
              return SliverToBoxAdapter(child: CircularProgressIndicator());
            }
            if (state is QuranFailed) {
              return SliverToBoxAdapter(child: Text(state.error));
            }
            if (state is QuranSuccess) {
              return QuranSurahSliverList(surahs: state.surahs);
            }
            return SliverToBoxAdapter(child: Text('Something went wrong'));
          },
        ),
      ],
    );
  }

  final List<String> filterTxt = ['سورة', 'جزء', 'المحفوظ'];
}
