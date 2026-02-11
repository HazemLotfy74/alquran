import 'dart:convert';
import 'dart:developer';

import 'package:alquran/constants/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../errors/exception.dart';

class ApiService {
  // ================== Get Surah ==================
  Future<List<dynamic>> getQuran() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl.quranApi));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data']['surahs'];
      } else {
        throw CustomException(message: 'Failed to load surah'.tr);
      }
    } catch (e) {
      log('Get Surah Error : $e');
      throw CustomException(message: 'Something went wrong'.tr);
    }
  }

  // ================== Get Audio ==================
  Future<Map<String, dynamic>> getAudio({
    required int surahNumber,
    required int reciterID,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiUrl.surahAudioApi}$reciterID/$surahNumber'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log(data.toString());
        return data;
      } else {
        throw CustomException(message: 'Failed to load surah'.tr);
      }
    } catch (e) {
      log('Get Surah Error : $e');
      throw CustomException(message: 'Something went wrong'.tr);
    }
  }
}
