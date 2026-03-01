import 'package:alquran/core/functions/on_generate_route.dart';
import 'package:alquran/shared/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/azkar_categories_cubit.dart';
import '../../cubit/azkar_categories_state.dart';

class AzkarCategoriesViewBody extends StatelessWidget {
  const AzkarCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBackgroundWidget(),
        // ✅ Foreground content
        BlocBuilder<AzkarCategoriesCubit, AzkarCategoriesState>(
          builder: (context, state) {
            if (state is AzkarCategoriesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AzkarCategoriesError) {
              return Center(child: Text(state.message));
            }

            if (state is AzkarCategoriesLoaded) {
              final categories = state.categories;

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final item = categories[index];

                      return ListTile(
                        tileColor: Colors.white.withValues(
                          alpha: 0.8,
                        ), // optional
                        title: Text(
                          item.title,
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRouter.readAzkar,
                            arguments: item.id,
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
