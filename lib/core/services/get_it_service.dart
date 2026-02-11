import 'package:alquran/constants/storage_keys.dart';
import 'package:alquran/core/services/api_service.dart';
import 'package:alquran/core/services/audio_service.dart';
import 'package:alquran/core/services/local_storage_service.dart';
import 'package:alquran/features/listen_to_quran/data/repo/audio_repo_impl.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/quran/data/repo/quran_repo_impl.dart';
import '../../features/quran/domain/repo/quran_repo.dart';
import '../entities/surah_entity.dart';
import 'hive_service.dart';

final getIt = GetIt.instance;
final hive = HiveService();

Future<void> setup() async {
  await hive.init();
  await hive.openBox<SurahEntity>(StorageKeys.favorites);
  await hive.openBox<dynamic>(StorageKeys.lastRead);
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<LocalStorageService>(hive);
  getIt.registerSingleton<AudioService>(AudioService());
  getIt.registerSingleton<QuranRepo>(
    QuranRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<AudioRepo>(
    AudioRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
