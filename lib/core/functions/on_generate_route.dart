import 'package:alquran/features/home/presentation/views/home_view.dart';
import 'package:alquran/features/quran/presentation/views/quran_view.dart';
import 'package:alquran/features/quran/presentation/views/read_quran_view.dart';
import 'package:flutter/material.dart';

import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splash = '/';
  static const String mainLayout = '/mainLayout';
  static const String home = '/home';
  static const String quran = '/quran';
  static const String readQuran = '/readQuran';
  static const String prayer = '/prayer';

  // ================= Route Generator =================

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      // case mainLayout:
      //   return MaterialPageRoute(builder: (_) => const MainLayoutPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case readQuran:
        return MaterialPageRoute(builder: (_) => const ReadQuranView());
      // case prayer:
      //   return MaterialPageRoute(builder: (_) => const TimePrayerView());
      case quran:
        return MaterialPageRoute(builder: (_) => const QuranView());
      default:
        return MaterialPageRoute(builder: (_) => HomeView());
    }
  }
}
