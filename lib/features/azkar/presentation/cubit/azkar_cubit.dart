import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_azkar_by_category_usecase.dart';
import 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final GetAzkarByCategoryUseCase getAzkarByCategory;

  AzkarCubit(this.getAzkarByCategory) : super(AzkarInitial());

  Future<void> fetchAzkar(int categoryId) async {
    emit(AzkarLoading());
    try {
      final result = await getAzkarByCategory(categoryId);
      emit(AzkarLoaded(result));
    } catch (e) {
      emit(AzkarError(e.toString()));
    }
  }
}
