import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/datasources/azkar_remote_data_source_impl.dart';
import 'azkar_categories_state.dart';

class AzkarCategoriesCubit extends Cubit<AzkarCategoriesState> {
  final AzkarRemoteDataSourceImpl remote;

  AzkarCategoriesCubit(this.remote) : super(const AzkarCategoriesInitial());

  Future<void> fetchCategories() async {
    emit(const AzkarCategoriesLoading());
    try {
      final list = await remote.getAllCategories();
      emit(AzkarCategoriesLoaded(list));
    } catch (e) {
      emit(AzkarCategoriesError('Something went wrong'.tr));
    }
  }
}
