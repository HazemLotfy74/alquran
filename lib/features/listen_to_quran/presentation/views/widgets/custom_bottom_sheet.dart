import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/custom_bottom_sheet_handle.dart';
import 'package:alquran/features/listen_to_quran/presentation/views/widgets/surah_list_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bottomSheet(context),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Column(
          children: [
            CustomBottomSheetHandle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الفاتحة',
                  style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
                ),
                Text(
                  'Al-Fatiah',
                  style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SurahListBottomSheet();
      },
    );
  }
}
