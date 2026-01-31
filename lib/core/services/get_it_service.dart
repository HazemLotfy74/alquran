import 'package:alquran/core/services/api_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/quran/data/repo/quran_repo_impl.dart';
import '../../features/quran/domain/repo/quran_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<QuranRepo>(
    QuranRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
