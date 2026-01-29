import 'package:alquran/features/home/domain/entities/home_grid_items_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class HomeViewGridItems extends StatelessWidget {
  const HomeViewGridItems({super.key, required this.item, required this.onTap});
  final HomeGridItemsEntity item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                SvgPicture.asset(
                  item.image,
                  height: constraints.maxHeight * 0.3,
                ),
                Text(
                  item.title,
                  style: AppTextStyle.bold20.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
