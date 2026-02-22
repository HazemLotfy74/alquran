import 'dart:convert';

import 'package:alquran/constants/api.dart';
import 'package:alquran/core/errors/exception.dart';
import 'package:alquran/features/azkar/data/datasources/azkar_remote_data_source.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/azkar_category_model.dart';

class AzkarRemoteDataSourceImpl implements AzkarRemoteDataSource {
  final http.Client client;

  AzkarRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> getAzkarByCategory(int categoryId) async {
    try {
      final response = await client.get(
        Uri.parse(ApiUrl.azkarApiCategory(categoryId)),
      );

      if (response.statusCode != 200) {
        throw CustomException(message: 'Failed to load azkar'.tr);
      }

      final body = response.body.trim().replaceAll('\uFEFF', '');
      final decoded = jsonDecode(body);

      if (decoded is! Map<String, dynamic>) {
        throw CustomException(message: 'Failed to load azkar'.tr);
      }
      return decoded;
    } catch (e) {
      throw CustomException(message: 'Failed to load azkar');
    }
  }

  // get All Azkar
  Future<List<AzkarCategoryModel>> getAllCategories() async {
    try {
      final response = await client.get(Uri.parse(ApiUrl.azkarApi));

      if (response.statusCode != 200) {
        throw Exception('Failed to load categories');
      }

      final body = response.body.trim().replaceAll('\uFEFF', '');
      final decoded = jsonDecode(body);

      // ✅ 1) The endpoint might return a List directly
      if (decoded is List) {
        return decoded
            .map((e) => AzkarCategoryModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      // ✅ 2) Or it might return a Map with a key that contains the List
      if (decoded is Map<String, dynamic>) {
        // find the first value that is a List
        final listValue =
            decoded.values.firstWhere(
                  (v) => v is List,
                  orElse: () =>
                      throw Exception('No list found in categories response'),
                )
                as List;

        return listValue
            .map((e) => AzkarCategoryModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      throw Exception(
        'Unexpected categories JSON type: ${decoded.runtimeType}',
      );
    } catch (e) {
      throw Exception('AzkarRemoteDataSource categories error: $e');
    }
  }
}
