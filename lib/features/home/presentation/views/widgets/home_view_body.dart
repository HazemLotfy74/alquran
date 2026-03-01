import 'package:alquran/features/home/presentation/views/widgets/home_view_body_sliver_grid.dart';
import 'package:alquran/features/home/presentation/views/widgets/location_and_time_widget.dart';
import 'package:alquran/shared/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';

import 'continue_reading_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBackgroundWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 25),
          child: CustomScrollView(
            slivers: [
              const LocationAndTimeWidget(),
              const ContinueReadingWidget(),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
              HomeViewBodySliverGrid(),
            ],
          ),
        ),
      ],
    );
  }
}
