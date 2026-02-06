import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class MisbahaCounter extends StatelessWidget {
  final int count;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final VoidCallback onReset;

  const MisbahaCounter({
    super.key,
    required this.count,
    required this.onPlus,
    required this.onMinus,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140,
          // radius * 2
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent, // background
            border: Border.all(
              color: AppColors.primaryColor, // green border
              width: 3,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            '$count',
            style: AppTextStyle.bold64.copyWith(color: AppColors.titleColor),
          ),
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: onPlus, child: Icon(Icons.add)),
            const SizedBox(width: 20),
            ElevatedButton(onPressed: onMinus, child: Icon(Icons.remove)),
          ],
        ),
        const SizedBox(height: 25),

        ElevatedButton(onPressed: onReset, child: Icon(Icons.restart_alt)),
      ],
    );
  }
}
