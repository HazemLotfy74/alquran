import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/features/azkar/data/model/azkar_category_model.dart';
import 'package:flutter/material.dart';

class AzkarListItems extends StatelessWidget {
  const AzkarListItems({super.key, required this.categories});

  final List<AzkarCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    item.title,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyle.semiBold16,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.readAzkar,
                      arguments: item.id,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
