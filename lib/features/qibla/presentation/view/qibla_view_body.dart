import 'dart:math' as math;

import 'package:alquran/core/services/location_service.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';

import '../../../../core/services/get_it_service.dart';
import '../cubit/qibla_cubit.dart';
import '../cubit/qibla_state.dart';
import 'widgets/qibla_compass_card.dart';

class QiblaViewBody extends StatelessWidget {
  const QiblaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QiblaCubit(getIt.get<LocationService>()),
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(Assets.imagesBackground2, fit: BoxFit.cover),
              ),
              SafeArea(
                child: Center(
                  child: BlocBuilder<QiblaCubit, QiblaState>(
                    builder: (context, state) {
                      if (state is QiblaLoading || state is QiblaInitial) {
                        return const CircularProgressIndicator();
                      }

                      if (state is QiblaError) {
                        return Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        );
                      }

                      final bearing = (state as QiblaLoaded).qibla.bearing;

                      return StreamBuilder<CompassEvent>(
                        stream: FlutterCompass.events,
                        builder: (context, snap) {
                          final heading = snap.data?.heading;

                          if (heading == null) {
                            return const Text(
                              'Compass not available',
                              style: TextStyle(color: Colors.white),
                            );
                          }

                          final angleRad =
                              (bearing - heading) * (math.pi / 180);

                          return QiblaCompassCard(
                            angleRadians: angleRad,
                            bearingDegrees: bearing,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
