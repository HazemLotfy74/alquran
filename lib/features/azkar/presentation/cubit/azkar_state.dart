import '../../domain/entities/azkar_category_entity.dart';

abstract class AzkarState {
  const AzkarState();
}

class AzkarInitial extends AzkarState {
  const AzkarInitial();
}

class AzkarLoading extends AzkarState {
  const AzkarLoading();
}

class AzkarLoaded extends AzkarState {
  final AzkarCategoryEntity data;

  const AzkarLoaded(this.data);
}

class AzkarError extends AzkarState {
  final String message;

  const AzkarError(this.message);
}
