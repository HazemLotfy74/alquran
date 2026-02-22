import 'package:alquran/core/cubits/location_cubit/location_cubit.dart';
import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/core/services/get_it_service.dart';
import 'package:alquran/core/utils/app_theme.dart';
import 'package:alquran/features/quran/domain/repo/quran_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:media_store_plus/media_store_plus.dart';

import 'core/services/local_storage_service.dart';
import 'core/services/location_service.dart';
import 'core/utils/app_bloc_observer.dart';
import 'localization/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await MediaStore.ensureInitialized();
    MediaStore.appFolder = "Quran Downloads";
  }
  await setup();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuranCubit(
            quranRepo: getIt.get<QuranRepo>(),
            localStorageService: getIt.get<LocalStorageService>(),
          )..getSurahs(),
        ),
        BlocProvider(
          create: (context) =>
              LocationCubit(locationService: LocationService())..getLocation(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        locale: Locale('ar'),
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: 'Alquran',
        theme: AppTheme.lightTheme,
        initialRoute: AppRouter.splash,
      ),
    );
  }
}
