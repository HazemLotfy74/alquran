import 'dart:developer';

import 'package:alquran/core/entities/location_entity.dart';
import 'package:bloc/bloc.dart';

import '../../services/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationService}) : super(LocationInitial());
  final LocationService locationService;
  Future<void> getLocation() async {
    emit(LocationLoading());

    try {
      final result = await locationService.initializeLocationPermission();

      if (result.isLeft()) {
        emit(LocationError(message: result.swap().getOrElse(() => 'error')));
        return;
      }

      final location = await locationService.getLocation();

      log('EMITTING LOCATION SUCCESS');

      emit(LocationSuccess(locationEntity: location));
    } catch (e) {
      emit(LocationError(message: e.toString()));
    }
  }
}
