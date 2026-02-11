import 'package:alquran/core/utils/app_colors.dart';
import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AzkarCounterWidget extends StatefulWidget {
  const AzkarCounterWidget({
    super.key,
    required this.pageController,
    required this.totalZekr,
    required this.currentIndex,
  });
  final PageController pageController;
  final int currentIndex;
  final int totalZekr;

  @override
  State<AzkarCounterWidget> createState() => _AzkarCounterWidgetState();
}

class _AzkarCounterWidgetState extends State<AzkarCounterWidget> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.large(
              onPressed: () {
                if (currentIndex < widget.totalZekr) {
                  currentIndex++;
                  setState(() {});
                }
                if (currentIndex == widget.totalZekr) {
                  currentIndex = 0;
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  setState(() {});
                }
              },
              shape: CircleBorder(),
              backgroundColor: AppColors.primaryColor,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: currentIndex.toString(),
                      style: AppTextStyle.semiBold18.copyWith(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                      text: '/',
                      style: AppTextStyle.medium15.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: widget.totalZekr.toString(),
                      style: AppTextStyle.medium15.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (currentIndex > 0) {
                      currentIndex = 0;
                      setState(() {});
                    }
                    widget.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: Icon(Icons.skip_next_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_circle, size: 30),
                  color: AppColors.primaryColor,
                ),
                IconButton(
                  onPressed: () {
                    if (currentIndex > 0) {
                      currentIndex = 0;
                      setState(() {});
                    }
                    widget.pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(Icons.skip_previous_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
