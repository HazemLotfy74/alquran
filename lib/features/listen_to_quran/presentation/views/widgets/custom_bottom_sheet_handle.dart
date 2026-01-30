import 'package:flutter/material.dart';

class CustomBottomSheetHandle extends StatelessWidget {
  const CustomBottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 6),
          width: 25,
          height: 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
