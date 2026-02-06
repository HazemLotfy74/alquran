import 'package:alquran/features/quran/presentation/views/widgets/quran_view_body.dart';
import 'package:flutter/material.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: QuranViewBody()));
  }
}
