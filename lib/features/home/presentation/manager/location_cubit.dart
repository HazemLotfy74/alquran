import 'dart:developer';

import 'package:alquran/core/entities/location_entity.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/services/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationService}) : super(LocationInitial()) {
    log('LocationCubit CREATED');
  }
  final LocationService locationService;
  Future<void> getLocation() async {
    emit(LocationLoading());
    var result = await locationService.initializeLocationPermission();
    result.fold(
      (error) {
        emit(LocationError(message: error));
      },
      (r) async {
        var location = await locationService.getLocation();
        log(location.city ?? 'no city');
        emit(LocationSuccess(locationEntity: location));
      },
    );
  }
}
