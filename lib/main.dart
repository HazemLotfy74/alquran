import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/core/utils/app_theme.dart';
import 'package:alquran/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      title: 'Alquran',
      theme: AppTheme.lightTheme,
      initialRoute: SplashView.routeName,
    );
  }
}
