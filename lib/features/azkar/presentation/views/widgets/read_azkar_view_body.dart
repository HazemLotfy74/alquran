import 'package:alquran/core/utils/app_text_style.dart';
import 'package:alquran/shared/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/azkar_cubit.dart';
import '../../cubit/azkar_state.dart';
import 'azkar_counter_widget.dart';

class ReadAzkarViewBody extends StatefulWidget {
  const ReadAzkarViewBody({super.key});

  @override
  State<ReadAzkarViewBody> createState() => _ReadAzkarViewBodyState();
}

class _ReadAzkarViewBodyState extends State<ReadAzkarViewBody> {
  int currentIndex = 0;

  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<AzkarCubit, AzkarState>(
            builder: (context, state) {
              if (state is AzkarLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is AzkarError) {
                return Center(child: Text(state.message));
              }

              if (state is AzkarLoaded) {
                final azkarList = state.data.azkar;
                azkarList[currentIndex];
                return PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  itemCount: azkarList.length,
                  onPageChanged: (index) {
                    currentIndex = index;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    final zekr = azkarList[index];
                    return Stack(
                      children: [
                        AppBackgroundWidget(),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 25,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                zekr.arabicText,
                                textDirection: TextDirection.rtl,
                                style: AppTextStyle.semiBold16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),

        BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is! AzkarLoaded) {
              return const SizedBox.shrink();
            }

            final azkarList = state.data.azkar;
            final currentZekr = azkarList[currentIndex];

            return AzkarCounterWidget(
              pageController: pageController,
              currentIndex: currentIndex,
              totalZekr: currentZekr.repeat,
              audioUrl: currentZekr.audio ?? '',
            );
          },
        ),
      ],
    );
  }
}
