import 'package:alquran/core/widgets/custom_app_bar.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/listen_to_quran_view_body.dart';
import 'package:flutter/material.dart';

class ListenToQuranView extends StatelessWidget {
  const ListenToQuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'الاستماع'),
      body: ListenToQuranViewBody(),
    );
  }
}
