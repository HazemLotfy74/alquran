import 'package:alquran/features/quran/presentation/views/widgets/animated_filter_item.dart';
import 'package:flutter/material.dart';

class QuranFilterWidget extends StatefulWidget {
  const QuranFilterWidget({super.key, required this.filterTxt});

  final List<String> filterTxt;

  @override
  State<QuranFilterWidget> createState() => _QuranFilterWidgetState();
}

class _QuranFilterWidgetState extends State<QuranFilterWidget> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.grey.shade200,
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.filterTxt.length, (index) {
          return ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  selectedIndex.value = index;
                },
                child: AnimatedFilterItem(
                  index: index,
                  isActive: selectedIndex.value == index,
                  text: widget.filterTxt[index],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
