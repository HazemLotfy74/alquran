import 'package:alquran/core/services/get_it_service.dart';
import 'package:alquran/core/services/location_service.dart';
import 'package:alquran/features/home/presentation/manager/location_cubit.dart';
import 'package:alquran/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LocationCubit(locationService: getIt.get<LocationService>())
            ..getLocation(),
      child: Scaffold(body: HomeViewBody()),
    );
  }
}
