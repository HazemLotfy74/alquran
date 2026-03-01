import 'package:alquran/features/qibla/presentation/view/qibla_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_app_bar.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'قبلة الصلاة'),
      body: const QiblaViewBody(),
    );
  }
}
