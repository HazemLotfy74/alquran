part of 'location_cubit.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final LocationEntity locationEntity;
  LocationSuccess({required this.locationEntity});
}

class LocationError extends LocationState {
  final String message;
  LocationError({required this.message});
}
