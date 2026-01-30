import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/features/azkar/domain/entities/azkar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AzkarViewBodySliverList extends StatelessWidget {
  const AzkarViewBodySliverList({super.key, required this.azkarType});

  final List<AzkarTypeEntity> azkarType;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: azkarType.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.readAzkar,
              arguments: azkarType[index],
            );
          },
          leading: SvgPicture.asset(
            azkarType[index].image,
            width: 40,
            height: 40,
          ),
          title: Text(azkarType[index].title, style: AppTextStyle.medium15),
          subtitle: Text(
            "عدد الاذكار: ${azkarType[index].totalNumber.toString()}",
            style: AppTextStyle.regular13.copyWith(color: AppColors.greyColor3),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 15,
            color: Colors.grey,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 1, color: Colors.grey.shade200);
      },
    );
  }
}
