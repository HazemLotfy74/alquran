import 'package:alquran/shared/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/views/widgets/misanaha_counter.dart';
import '../../presentation/views/widgets/misbaha_header.dart';
import '../cubit/sibha_cubit.dart';

class MisbahaViewBody extends StatelessWidget {
  const MisbahaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          AppBackgroundWidget(),
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
