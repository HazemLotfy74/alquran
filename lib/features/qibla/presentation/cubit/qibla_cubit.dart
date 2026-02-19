import 'package:adhan/adhan.dart';
import 'package:alquran/features/qibla/presentation/cubit/qibla_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/location_service.dart';
import '../../domain/entities/qibla_entity.dart';

class QiblaCubit extends Cubit<QiblaState> {
  final LocationService locationService;

  QiblaCubit(this.locationService) : super(QiblaInitial());

  Future<void> loadQibla() async {
    // loading state
    emit(const QiblaLoading());

    // location permission
    final perm = await locationService.initializeLocationPermission();

    // if permission is granted
    await perm.fold((err) async => emit(QiblaError(err)), (_) async {
      final loc = await locationService.getLocation();
      if (loc.latitude == null || loc.longitude == null) {
        emit(const QiblaError("Location is null"));
        return;
      }
      // get coordinates
      final coords = Coordinates(loc.latitude!, loc.longitude!);
      // get bearing from coordinates
      final bearing = Qibla(coords).direction;
      // emit success state
      emit(QiblaLoaded(QiblaEntity(bearing: bearing)));
    });
  }
}
