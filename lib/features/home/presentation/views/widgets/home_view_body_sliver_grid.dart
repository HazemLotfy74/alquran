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
    HomeGridItemsEntity(image: Assets.imagesDohaa, title: 'ادعية'),
    HomeGridItemsEntity(image: Assets.imagesPrayDaySvgrepo, title: 'الاذكار'),
    HomeGridItemsEntity(image: Assets.imagesSebah, title: 'المسبحة'),
    HomeGridItemsEntity(
      image: Assets.imagesClockSvgrepo,
      title: 'مواقيت الصلاه',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return HomeViewGridItems(item: items[index]);
      },
    );
  }
}
