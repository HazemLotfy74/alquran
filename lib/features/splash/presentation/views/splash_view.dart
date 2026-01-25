import 'package:alquran/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  // I delete it because we don't need it
  // static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
