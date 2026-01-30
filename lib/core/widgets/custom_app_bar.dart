import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios_sharp),
    ),
    title: Text(
      title,
      style: AppTextStyle.semiBold18.copyWith(color: AppColors.titleColor),
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SvgPicture.asset(Assets.imagesMore),
      ),
    ],
  );
}
