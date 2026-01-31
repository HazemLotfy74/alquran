import 'package:alquran/core/widgets/custom_app_bar.dart';
import 'package:alquran/features/quran/domain/entities/surah_entity.dart';
import 'package:alquran/features/quran/presentation/views/widgets/read_quran_view_body.dart';
import 'package:flutter/material.dart';

class ReadQuranView extends StatelessWidget {
  const ReadQuranView({super.key, required this.surah});
  final SurahEntity surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: surah.name),
      body: ReadQuranViewBody(surahEntity: surah),
    );
  }
}
