import 'package:alquran/features/azkar/presentation/views/azkar_view.dart';
import 'package:alquran/features/azkar/presentation/views/read_azkar_view.dart';
import 'package:alquran/features/home/presentation/views/home_view.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/listen_to_quran_view.dart';
import 'package:alquran/features/main_layout/presentation/pages/main_layout_page.dart';
import 'package:alquran/features/quran/presentation/views/quran_view.dart';
import 'package:alquran/features/quran/presentation/views/read_quran_view.dart';
import 'package:alquran/features/time_prayer/presentation/time_prayer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../features/azkar/data/datasources/azkar_remote_data_source_impl.dart';
import '../../features/azkar/domain/repositories/azkar_repository_impl.dart';
import '../../features/azkar/domain/usecases/get_azkar_by_category_usecase.dart';
import '../../features/azkar/presentation/cubit/azkar_audio_cubit.dart';
import '../../features/azkar/presentation/cubit/azkar_cubit.dart';
import '../../features/misbaha/presentation/misbaha_view.dart';
import '../../features/qibla/presentation/view/qibla_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../entities/surah_entity.dart';
import '../services/audio_service.dart';
import '../services/get_it_service.dart';

class AppRouter {
  static const String splash = '/';
  static const String mainLayout = '/mainLayout';
  static const String home = '/home';
  static const String readQuran = '/readQuran';
  static const String quran = '/quran';
  static const String listenToQuran = '/listenToQuran';
  static const String azkar = '/azkar';
  static const String readAzkar = '/readAzkar';
  static const String prayer = '/prayer';
  static const String misbaha = '/misbaha';
  static const String qibla = '/qibla';

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
        return MaterialPageRoute(
          builder: (_) =>
              ReadQuranView(surah: settings.arguments as SurahEntity),
        );
      case listenToQuran:
        return MaterialPageRoute(builder: (_) => ListenToQuranView());
      case azkar:
        return MaterialPageRoute(builder: (_) => const AzkarView());
      case readAzkar:
        final categoryId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<AzkarCubit>(
                create: (_) {
                  final client = http.Client();
                  final remote = AzkarRemoteDataSourceImpl(client: client);
                  final repo = AzkarRepositoryImpl(remoteDataSource: remote);
                  final usecase = GetAzkarByCategoryUseCase(repo);
                  return AzkarCubit(usecase);
                },
              ),
              BlocProvider<AzkarAudioCubit>(
                create: (_) => AzkarAudioCubit(getIt.get<AudioService>()),
              ),
            ],
            child: ReadAzkarView(categoryId: categoryId),
          ),
        );

      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case prayer:
        return MaterialPageRoute(builder: (_) => const TimePrayerView());
      case misbaha:
        return MaterialPageRoute(builder: (_) => const MisbahaView());
      case qibla:
        return MaterialPageRoute(builder: (_) => const QiblaView());
      default:
        return MaterialPageRoute(builder: (_) => HomeView());
    }
  }
}
