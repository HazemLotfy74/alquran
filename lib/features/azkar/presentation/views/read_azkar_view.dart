import 'package:alquran/core/widgets/custom_app_bar.dart';
import 'package:alquran/features/azkar/presentation/views/widgets/read_azkar_view_body.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/azkar_entity.dart';

class ReadAzkarView extends StatelessWidget {
  const ReadAzkarView({super.key, required this.azkar});
  final AzkarTypeEntity azkar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: azkar.title),
      body: ReadAzkarViewBody(azkar: azkar),
    );
  }
}
