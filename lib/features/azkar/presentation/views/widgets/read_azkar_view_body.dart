import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alquran/generated/assets.dart';
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

                return PageView.builder(
                  controller: pageController,
                  itemCount: azkarList.length,
                  onPageChanged: (i) => setState(() => currentIndex = i),
                  itemBuilder: (context, index) {
                    final zekr = azkarList[index];

                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            Assets.imagesBackground2,
                            fit: BoxFit.fill,
                          ),
                        ),
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }

              // initial state before fetching
              return const SizedBox.shrink();
            },
          ),
        ),

        BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            final total = (state is AzkarLoaded) ? state.data.azkar.length : 0;

            return AzkarCounterWidget(
              pageController: pageController,
              currentIndex: currentIndex,
              totalZekr: total,
            );
          },
        ),
      ],
    );
  }
}
