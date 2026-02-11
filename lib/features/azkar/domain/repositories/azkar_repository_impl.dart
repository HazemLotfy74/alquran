import 'package:alquran/features/azkar/domain/entities/azkar_category_entity.dart';
import '../../data/datasources/azkar_remote_data_source.dart';
import '../../data/model/azkar_model.dart';
import 'azkar_repository.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  final AzkarRemoteDataSource remoteDataSource;

  AzkarRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AzkarCategoryEntity> getAzkarByCategory(int categoryId) async {
    final data = await remoteDataSource.getAzkarByCategory(categoryId);
    if (data.isEmpty) {
      throw Exception('No data found');
    }
    final String title = data.keys.first;
    final List<dynamic> list = data[title] as List<dynamic>;
    final azkarList = list
        .map((e) => AzkarModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return AzkarCategoryEntity(title: title, azkar:  azkarList);
  }
}
