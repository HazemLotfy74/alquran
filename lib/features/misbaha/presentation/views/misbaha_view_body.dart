import 'package:alquran/features/misbaha/presentation/views/widgets/misanaha_counter.dart';
import 'package:alquran/features/misbaha/presentation/views/widgets/misbaha_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/assets.dart';
import '../cubit/sibha_cubit.dart';

class MisbahaViewBody extends StatelessWidget {
  const MisbahaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // back ground
          Image.asset(
            Assets.imagesBackground2,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const MisbahaHeader(),
                const SizedBox(height: 24),
                Expanded(
                  child: Center(
                    child: BlocBuilder<SibhaCubit, int>(
                      builder: (context, count) {
                        return MisbahaCounter(
                          count: count,
                          onPlus: () => context.read<SibhaCubit>().increment(),
                          onMinus: () => context.read<SibhaCubit>().decrement(),
                          onReset: () => context.read<SibhaCubit>().reset(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
