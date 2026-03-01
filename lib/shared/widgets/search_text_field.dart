import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/app_colors.dart';
import '../../generated/assets.dart';
import '../../shared/widgets/custom_outline_border.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    this.onTap,
    this.onFilterTap,
  });
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),

      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'ابحث عن سورة,رقم الجزء..',
          hintStyle: AppTextStyle.regular13.copyWith(
            color: AppColors.greyColor,
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.search)),
          ),
          border: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
