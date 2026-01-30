import 'package:alquran/core/widgets/custom_app_bar.dart';
import 'package:alquran/features/azkar/presentation/views/widgets/azkar_view_body.dart';
import 'package:flutter/material.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'الاذكار'),
      body: AzkarViewBody(),
    );
  }
}
