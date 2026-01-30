import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahListBottomSheet extends StatelessWidget {
  const SurahListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 16),

          Text('Surahs'.tr, style: AppTextStyle.semiBold16),

          const SizedBox(height: 16),

          Expanded(
            child: ListView.separated(
              itemCount: 114,
              separatorBuilder: (_, _) =>
                  Divider(height: 1, color: Colors.grey.shade200),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('الفاتحة', style: AppTextStyle.semiBold16),
                  subtitle: Text(
                    'Al-Fatihah',
                    style: AppTextStyle.regular13.copyWith(
                      color: AppColors.greyColor3,
                    ),
                  ),
                  trailing: Icon(
                    Icons.play_circle,
                    color: AppColors.primaryColor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
