import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'continue_reading_item.dart';

class ContinueReadingWidget extends StatelessWidget {
  const ContinueReadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranSuccess) {
          final lastRead = context.watch<QuranCubit>().lastReadModel;
          if (lastRead == null) {
            return const SliverToBoxAdapter(child: SizedBox());
          }
          return SliverToBoxAdapter(
            child: Card(
              color: AppColors.primaryColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ContinueReadingItem(lastRead: lastRead),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
