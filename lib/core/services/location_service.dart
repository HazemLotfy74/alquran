import 'package:alquran/core/entities/location_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

class LocationService {
  final Location location = Location();

  Future<Either<String, bool>> initializeLocationPermission() async {
    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return Left('Enable your location');
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return Left('Location permission denied'); // Permission Denied
        }
      }
      return Right(true);
    } catch (e) {
      return Left('error initialize location');
    }
  }

  Future<LocationEntity> getLocation() async {
    LocationData locationData = await location.getLocation();
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );

    if (placemarks.isNotEmpty) {
      final p = placemarks.first;

      return LocationEntity(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
        address: p.administrativeArea,
        city: p.subAdministrativeArea,
        country: p.country,
      );
    }
    return LocationEntity(
      latitude: 0,
      longitude: 0,
      address: '',
      city: '',
      country: '',
    );
  }
}
