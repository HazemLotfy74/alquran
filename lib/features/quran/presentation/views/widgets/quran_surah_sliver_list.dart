import 'package:alquran/features/quran/presentation/views/widgets/quran_item.dart';
import 'package:flutter/material.dart';

class QuranSurahSliverList extends StatelessWidget {
  const QuranSurahSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: QuranItem(),
        );
      },
    );
  }
}
