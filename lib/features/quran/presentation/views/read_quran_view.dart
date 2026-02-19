import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/features/quran/presentation/views/widgets/read_quran_view_body.dart';
import 'package:alquran/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/surah_entity.dart';
import '../../../../core/utils/app_colors.dart';

class ReadQuranView extends StatefulWidget {
  const ReadQuranView({super.key, required this.surah});

  final SurahEntity surah;

  @override
  State<ReadQuranView> createState() => _ReadQuranViewState();
}

class _ReadQuranViewState extends State<ReadQuranView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: widget.surah.name,
        actions: [
          IconButton(
            onPressed: () {
              context.read<QuranCubit>().addToFavorite(widget.surah);
            },
            icon: Builder(
              builder: (context) {
                final cubit = context.watch<QuranCubit>();
                return Icon(
                  cubit.favoriteSurahs.contains(widget.surah)
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined,
                  color: cubit.favoriteSurahs.contains(widget.surah)
                      ? AppColors.primaryColor
                      : Colors.grey,
                );
              },
            ),
          ),
        ],
      ),
      body: ReadQuranViewBody(surahEntity: widget.surah),
    );
  }
}
