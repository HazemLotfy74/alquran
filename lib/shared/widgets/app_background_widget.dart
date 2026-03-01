import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';

class AppBackgroundWidget extends StatelessWidget {
  const AppBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(Assets.background2, fit: BoxFit.fill),
    );
  }
}
