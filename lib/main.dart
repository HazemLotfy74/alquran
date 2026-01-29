import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'localization/app_localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //hhhhh
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Locale('ar'),
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'Alquran',
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.splash,
    );
  }
}
