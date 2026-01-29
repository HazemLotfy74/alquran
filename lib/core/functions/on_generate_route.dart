import 'package:alquran/features/home/presentation/views/home_view.dart';
import 'package:alquran/features/main_layout/presentation/pages/main_layout_page.dart';
import 'package:alquran/features/time_prayer/presentation/time_prayer_view.dart';
import 'package:flutter/material.dart';

import '../../features/misbaha/presentation/misbaha_view.dart';
import '../../features/quran/presentation/views/quran_view.dart';
import '../../features/quran/presentation/views/read_quran_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splash = '/';
  static const String mainLayout = '/mainLayout';
  static const String home = '/home';
  static const String readQuran = '/readQuran';
  static const String quran = '/quran';
  static const String prayer = '/prayer';
  static const String misbaha = '/misbaha';

  // ================= Route Generator =================

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayoutPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case prayer:
        return MaterialPageRoute(builder: (_) => const TimePrayerView());
      case quran:
        return MaterialPageRoute(builder: (_) => const QuranView());
      case readQuran:
        return MaterialPageRoute(builder: (_) => const ReadQuranView());
      case misbaha:
        return MaterialPageRoute(builder: (_) => const MisbahaView());
      default:
        return MaterialPageRoute(builder: (_) => HomeView());
    }
  }
}
