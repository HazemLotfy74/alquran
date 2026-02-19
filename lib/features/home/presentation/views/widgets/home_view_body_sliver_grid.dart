import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/features/home/domain/entities/home_grid_items_entity.dart';
import 'package:alquran/features/home/presentation/views/widgets/home_view_grid_items.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';

class HomeViewBodySliverGrid extends StatelessWidget {
  HomeViewBodySliverGrid({super.key});
  final List<HomeGridItemsEntity> items = [
    HomeGridItemsEntity(
      image: Assets.imagesQuranBookSvg,
      title: 'القران الكريم',
    ),
    HomeGridItemsEntity(
      image: Assets.imagesHeadphoneSvgrepo,
      title: 'الاستماع',
    ),
    HomeGridItemsEntity(
      image: Assets.assetsImagesQiblaCompassSvgrepoCom,
      title: 'قبلة الصلاة',
    ),
    HomeGridItemsEntity(image: Assets.imagesPrayDaySvgrepo, title: 'الاذكار'),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return HomeViewGridItems(
          item: items[index],
          onTap: () {
            if (index == 0) {
              Navigator.pushNamed(context, AppRouter.quran);
            }
            if (index == 1) {
              Navigator.pushNamed(context, AppRouter.listenToQuran);
            }
            if (index == 2) {
              Navigator.pushNamed(context, AppRouter.qibla);
            }
            if (index == 3) {
              Navigator.pushNamed(context, AppRouter.azkar);
            }
          },
        );
      },
    );
  }
}
