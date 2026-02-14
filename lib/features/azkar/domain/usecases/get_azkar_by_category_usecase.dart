import '../entities/azkar_category_entity.dart';
import '../repositories/azkar_repository.dart';

class GetAzkarByCategoryUseCase {
  final AzkarRepository repository;

  GetAzkarByCategoryUseCase(this.repository);

  Future<AzkarCategoryEntity> call(int categoryId) {
    return repository.getAzkarByCategory(categoryId);
  }
}
