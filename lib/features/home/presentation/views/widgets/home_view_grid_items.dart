import 'package:alquran/features/home/domain/entities/home_grid_items_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class HomeViewGridItems extends StatelessWidget {
  const HomeViewGridItems({super.key, required this.item});
  final HomeGridItemsEntity item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 60, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          SvgPicture.asset(item.image, width: 50, height: 50),
          Text(
            item.title,
            style: AppTextStyle.bold20.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
