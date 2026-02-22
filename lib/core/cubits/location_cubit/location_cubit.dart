import 'package:alquran/core/entities/location_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

import '../../services/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationService}) : super(LocationInitial());
  final LocationService locationService;
  Future<void> getLocation() async {
    emit(LocationLoading());

    final result = await locationService.initializeLocationPermission();
    result.fold(
      (error) {
        emit(LocationError(message: error));
      },
      (ser) async {
        if (ser) {
          final locationEntity = await locationService.getLocation();
          emit(LocationSuccess(locationEntity: locationEntity));
        }
        if (!ser) {
          emit(LocationError(message: 'Enable your location'.tr));
        }
      },
    );
  }
}
