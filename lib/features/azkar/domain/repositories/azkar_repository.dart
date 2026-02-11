import '../entities/azkar_category_entity.dart';

abstract class AzkarRepository {
  Future<AzkarCategoryEntity> getAzkarByCategory(int categoryId);
}

