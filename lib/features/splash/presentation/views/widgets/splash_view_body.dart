import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  void navigate() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) {
        return;
      }
      Navigator.pushNamed(context, AppRouter.home);
    });
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [Image.asset(Assets.imagesQuranSplash2)],
      ),
    );
  }
}
