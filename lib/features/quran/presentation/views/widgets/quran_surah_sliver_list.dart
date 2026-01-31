import 'package:alquran/features/quran/domain/entities/surah_entity.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_item.dart';
import 'package:flutter/material.dart';

class QuranSurahSliverList extends StatelessWidget {
  const QuranSurahSliverList({super.key, required this.surahs});
  final List<SurahEntity> surahs;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: QuranItem(surah: surahs[index]),
        );
      },
    );
  }
}
