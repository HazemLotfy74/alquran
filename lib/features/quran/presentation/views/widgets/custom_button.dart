import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    required this.image,
    required this.onTap,
  });
  final String txt;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            SvgPicture.asset(image),
            Text(
              txt,
              style: AppTextStyle.medium15.copyWith(
                color: AppColors.greyColor3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
