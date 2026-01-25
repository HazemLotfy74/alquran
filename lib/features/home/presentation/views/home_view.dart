import 'package:alquran/features/home/presentation/manager/location_cubit.dart';
import 'package:alquran/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:alquran/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: Scaffold(
        body: HomeViewBody(),
        bottomNavigationBar: BottomNavBar(
          onTap: (int value) {},
          currentIndex: 0,
        ),
      ),
    );
  }
}
