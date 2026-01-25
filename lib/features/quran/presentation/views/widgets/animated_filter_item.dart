import 'package:alquran/features/quran/presentation/views/widgets/selected_quran_filter_container.dart';
import 'package:alquran/features/quran/presentation/views/widgets/unselected_quran_filter_container.dart';
import 'package:flutter/material.dart';

class AnimatedFilterItem extends StatelessWidget {
  const AnimatedFilterItem({
    super.key,
    required this.index,
    required this.isActive,
    required this.text,
  });
  final int index;
  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: SelectedQuranFilterContainer(text: text),
      secondChild: UnselectedQuranFilterContainer(text: text),
      firstCurve: Curves.linear,
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(microseconds: 100),
    );
  }
}
