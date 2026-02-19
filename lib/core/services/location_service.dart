import 'dart:developer';

import 'package:alquran/core/entities/location_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationService {
  Location get location => Location();

  Future<Either<String, bool>> initializeLocationPermission() async {
    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return Left('Enable your location'.tr);
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return Left('Location permission denied'.tr); // Permission Denied
        }
      }
      return Right(true);
    } catch (e) {
      return Left('Error initialize location'.tr);
    }
  }

  Future<LocationEntity> getLocation() async {
    log('STEP 1');
    LocationData locationData = await location.getLocation();
    log('STEP 2');

    while (locationData.latitude == null || locationData.longitude == null) {
      await Future.delayed(const Duration(seconds: 1));
      locationData = await location.getLocation();
    }

    final placemarks = await geo.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    log('STEP 3');
    if (placemarks.isNotEmpty) {
      final p = placemarks.first;
      log('STEP 4');
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
