import 'package:alquran/features/quran/domain/repo/quran_repo.dart';
import 'package:bloc/bloc.dart';

import '../../entities/surah_entity.dart';
import '../../utils/arabic_text_normalize.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({required this.quranRepo}) : super(QuranInitial());
  final QuranRepo quranRepo;
  final List<SurahEntity> surahs = [];
  final List<SurahEntity> favoriteSurahs = [];
  SurahEntity? selectedSurah;

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

  void addToFavorite(SurahEntity surah) {
    if (favoriteSurahs.contains(surah)) return;

    favoriteSurahs.add(surah);
    emit(QuranSuccess(surahs: List.from(favoriteSurahs)));
  }

  void removeFromFavorite(SurahEntity surah) {
    if (!favoriteSurahs.contains(surah)) return;

    favoriteSurahs.remove(surah);
    emit(QuranSuccess(surahs: List.from(favoriteSurahs)));
  }

  void getFavoriteSurahs() {
    emit(QuranSuccess(surahs: List.from(favoriteSurahs)));
  }

  void selectSurah(SurahEntity surah) {
    selectedSurah = surah;
    emit(QuranSuccess(surahs: List.from(surahs)));
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
