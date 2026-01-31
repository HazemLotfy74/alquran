import 'dart:developer';

import 'package:alquran/core/errors/failure.dart';
import 'package:alquran/core/services/api_service.dart';
import 'package:alquran/features/quran/data/models/surah_model.dart';
import 'package:alquran/features/quran/domain/entities/surah_entity.dart';
import 'package:alquran/features/quran/domain/repo/quran_repo.dart';
import 'package:dartz/dartz.dart';

class QuranRepoImpl implements QuranRepo {
  const QuranRepoImpl({required this.apiService});
  final ApiService apiService;

  @override
  Future<Either<Failure, List<SurahEntity>>> getSurahs() async {
    try {
      final data = await apiService.getQuran();
      final surahs = List<SurahEntity>.from(
        data.map((e) {
          return Surah.fromJson(e).toSurahEntity();
        }),
      );
      log('Surah data = $surahs');
      return Right(surahs);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
