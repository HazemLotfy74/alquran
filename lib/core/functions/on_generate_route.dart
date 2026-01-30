import 'package:alquran/features/azkar/domain/entities/azkar_entity.dart';
import 'package:alquran/features/azkar/presentation/views/azkar_view.dart';
import 'package:alquran/features/azkar/presentation/views/read_azkar_view.dart';
import 'package:alquran/features/home/presentation/views/home_view.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/listen_to_quran_view.dart';
import 'package:alquran/features/main_layout/presentation/pages/main_layout_page.dart';
import 'package:alquran/features/quran/presentation/views/quran_view.dart';
import 'package:alquran/features/quran/presentation/views/read_quran_view.dart';
import 'package:alquran/features/time_prayer/presentation/time_prayer_view.dart';
import 'package:flutter/material.dart';

import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splash = '/';
  static const String mainLayout = '/mainLayout';
  static const String home = '/home';
  static const String quran = '/quran';
  static const String readQuran = '/readQuran';
  static const String listenToQuran = '/listenToQuran';
  static const String azkar = '/azkar';
  static const String readAzkar = '/readAzkar';
  static const String prayer = '/prayer';

  // ================= Route Generator =================

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayoutPage());
      case quran:
        return MaterialPageRoute(builder: (_) => const QuranView());
      case readQuran:
        return MaterialPageRoute(builder: (_) => const ReadQuranView());
      case listenToQuran:
        return MaterialPageRoute(builder: (_) => const ListenToQuranView());
      case azkar:
        return MaterialPageRoute(builder: (_) => const AzkarView());
      case readAzkar:
        return MaterialPageRoute(
          builder: (_) =>
              ReadAzkarView(azkar: settings.arguments as AzkarTypeEntity),
        );
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case prayer:
        return MaterialPageRoute(builder: (_) => const TimePrayerView());
      default:
        return MaterialPageRoute(builder: (_) => HomeView());
    }
  }
}
