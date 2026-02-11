import 'package:alquran/core/entities/location_entity.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/services/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> getLocation() async {
    emit(LocationLoading());
    var result = await LocationService().initializeLocationPermission();
    result.fold(
      (error) {
        emit(LocationError(message: error));
      },
      (r) async {
        var location = await LocationService().getLocation();
        emit(LocationSuccess(locationEntity: location));
      },
    );
  }
}
