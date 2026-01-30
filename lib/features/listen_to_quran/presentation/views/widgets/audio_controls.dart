import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioControls extends StatelessWidget {
  const AudioControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.imagesRepeat),
        Row(
          spacing: 15,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next_rounded,
                color: AppColors.arrowColor,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow_rounded, color: Colors.white),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous_rounded,
                color: AppColors.arrowColor,
                size: 35,
              ),
            ),
          ],
        ),
        SvgPicture.asset(Assets.imagesSetting),
      ],
    );
  }
}
