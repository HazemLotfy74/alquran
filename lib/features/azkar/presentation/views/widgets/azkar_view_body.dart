import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alquran/core/functions/on_generate_route.dart';
import '../../../../../generated/assets.dart';
import '../../cubit/azkar_categories_cubit.dart';
import '../../cubit/azkar_categories_state.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ✅ Background Image
        Positioned.fill(
          child: Image.asset(
            Assets.imagesBackground2,
            fit: BoxFit.cover,
          ),
        ),

        // ✅ Foreground Content
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

              return SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final item = categories[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.85),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
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
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
