import 'package:alquran/core/services/api_service.dart';
import 'package:alquran/core/services/audio_service.dart';
import 'package:alquran/features/listen_to_quran/data/repo/audio_repo_impl.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/quran/data/repo/quran_repo_impl.dart';
import '../../features/quran/domain/repo/quran_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<AudioService>(AudioService());
  getIt.registerSingleton<QuranRepo>(
    QuranRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<AudioRepo>(
    AudioRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
