import 'package:alquran/features/azkar/data/model/azkar_category_model.dart';
import 'package:alquran/features/azkar/presentation/views/widgets/azkar_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../generated/assets.dart';
import '../../cubit/azkar_categories_cubit.dart';
import '../../cubit/azkar_categories_state.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(Assets.imagesBackground2, fit: BoxFit.cover),
        ),

        BlocBuilder<AzkarCategoriesCubit, AzkarCategoriesState>(
          builder: (context, state) {
            if (state is AzkarCategoriesLoading) {
              return Skeletonizer(
                child: AzkarListItems(
                  categories: [
                    AzkarCategoryModel(id: 0, title: '', textUrl: ''),
                    AzkarCategoryModel(id: 0, title: '', textUrl: ''),
                    AzkarCategoryModel(id: 0, title: '', textUrl: ''),
                  ],
                ),
              );
            }

            if (state is AzkarCategoriesError) {
              return Center(child: Text(state.message));
            }

            if (state is AzkarCategoriesLoaded) {
              final categories = state.categories;
              return AzkarListItems(categories: categories);
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
