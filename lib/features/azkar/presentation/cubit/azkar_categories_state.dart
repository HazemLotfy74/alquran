import '../../data/model/azkar_category_model.dart';

abstract class AzkarCategoriesState {
  const AzkarCategoriesState();
}

class AzkarCategoriesInitial extends AzkarCategoriesState {
  const AzkarCategoriesInitial();
}

class AzkarCategoriesLoading extends AzkarCategoriesState {
  const AzkarCategoriesLoading();
}

class AzkarCategoriesLoaded extends AzkarCategoriesState {
  final List<AzkarCategoryModel> categories;
  const AzkarCategoriesLoaded(this.categories);
}

class AzkarCategoriesError extends AzkarCategoriesState {
  final String message;
  const AzkarCategoriesError(this.message);
}
