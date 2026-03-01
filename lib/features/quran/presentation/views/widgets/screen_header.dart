import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        Text('القرأن الكريم', style: AppTextStyle.bold20),
      ],
    );
  }
}
