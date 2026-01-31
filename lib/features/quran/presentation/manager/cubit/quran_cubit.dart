import 'package:alquran/features/quran/domain/entities/surah_entity.dart';
import 'package:alquran/features/quran/domain/repo/quran_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({required this.quranRepo}) : super(QuranInitial());
  final QuranRepo quranRepo;

  Future<void> getSurahs() async {
    emit(QuranLoading());
    final result = await quranRepo.getSurahs();
    result.fold(
      (l) {
        emit(QuranFailed(error: l.message));
      },
      (r) {
        emit(QuranSuccess(surahs: r));
      },
    );
  }
}
