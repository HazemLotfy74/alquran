import 'package:alquran/core/services/local_storage_service.dart';
import 'package:alquran/features/quran/domain/repo/quran_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/storage_keys.dart';
import '../../entities/surah_entity.dart';
import '../../utils/arabic_text_normalize.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({required this.quranRepo, required this.localStorageService})
    : super(QuranInitial()) {
    favoriteSurahs.addAll(
      localStorageService.getAll<SurahEntity>(favoritesBox),
    );
    localStorageService.get<dynamic>(StorageKeys.lastRead, StorageKeys.surah);

    localStorageService.get<dynamic>(StorageKeys.lastRead, StorageKeys.ayah);
  }
  final QuranRepo quranRepo;
  final LocalStorageService localStorageService;
  final List<SurahEntity> surahs = [];
  final List<SurahEntity> favoriteSurahs = [];
  SurahEntity? selectedSurah;

  static const favoritesBox = 'favorites';

  bool showFavorites = false;

  Future<void> getSurahs() async {
    emit(QuranLoading());
    final result = await quranRepo.getSurahs();
    result.fold(
      (l) {
        emit(QuranFailed(error: l.message));
      },
      (r) {
        surahs.clear();
        surahs.addAll(r);
        selectedSurah ??= surahs.firstWhere(
          (s) => s.number == 1,
          orElse: () => surahs.first,
        );
        emit(QuranSuccess(surahs: List.from(surahs)));
      },
    );
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(QuranSuccess(surahs: surahs));
      return;
    }
    final normalizedQuery = ArabicTextUtils.normalize(query);
    final result = surahs.where((search) {
      final normalizedName = ArabicTextUtils.normalize(search.name);
      return normalizedName.contains(normalizedQuery) ||
          search.ayahs.any((ayah) => ayah.juz.toString() == query);
    }).toList();
    if (result.isNotEmpty) {
      emit(QuranSuccess(surahs: result));
    } else {
      emit(QuranFailed(error: 'No results found'));
    }
  }

  Future<void> addToFavorite(SurahEntity surah) async {
    if (favoriteSurahs.contains(surah)) {
      removeFromFavorite(surah);
    }
    await localStorageService.put(favoritesBox, surah.number.toString(), surah);
    favoriteSurahs
      ..clear()
      ..addAll(localStorageService.getAll<SurahEntity>(favoritesBox));

    emit(QuranSuccess(surahs: List.from(surahs)));
  }

  Future<void> removeFromFavorite(SurahEntity surah) async {
    if (!favoriteSurahs.contains(surah)) return;
    await localStorageService.delete(favoritesBox, surah.number.toString());
    favoriteSurahs
      ..clear()
      ..addAll(localStorageService.getAll<SurahEntity>(favoritesBox));
    emit(QuranSuccess(surahs: List.from(surahs)));
  }

  void selectSurah(SurahEntity surah) {
    selectedSurah = surah;
    emit(QuranSuccess(surahs: List.from(surahs)));
  }

  void toggleFavorites(bool value) {
    showFavorites = value;
    emit(QuranSuccess(surahs: List.from(surahs)));
  }

  Future<void> saveLastRead(
    int surahNumber,
    int ayahNumber,
    double scrollOffset,
  ) async {
    await localStorageService.put<dynamic>(
      StorageKeys.lastRead,
      StorageKeys.surah,
      surahNumber,
    );

    await localStorageService.put<dynamic>(
      StorageKeys.lastRead,
      StorageKeys.ayah,
      ayahNumber,
    );
    await localStorageService.put<dynamic>(
      StorageKeys.lastRead,
      StorageKeys.scrollOffset,
      scrollOffset,
    );
  }

  SurahEntity? get nextSurah {
    if (selectedSurah == null) {
      return null;
    }
    final currentIndex = surahs.indexWhere(
      (element) => element.number == selectedSurah!.number,
    );
    if (currentIndex == -1 || currentIndex == surahs.length - 1) {
      return null;
    }
    return surahs[currentIndex + 1];
  }

  SurahEntity? get previousSurah {
    if (selectedSurah == null) {
      return null;
    }
    final currentIndex = surahs.indexWhere(
      (element) => element.number == selectedSurah!.number,
    );
    if (currentIndex <= 0) {
      return null;
    }
    return surahs[currentIndex - 1];
  }
}
