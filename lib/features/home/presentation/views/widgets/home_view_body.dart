import 'package:alquran/features/home/presentation/views/widgets/home_view_body_sliver_grid.dart';
import 'package:alquran/features/home/presentation/views/widgets/location_and_time_widget.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';

import 'continue_reading_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.imagesBackground2, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 25),
            child: CustomScrollView(
              slivers: [
                LocationAndTimeWidget(),
                ContinueReadingWidget(),
                HomeViewBodySliverGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
