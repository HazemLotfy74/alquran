import 'package:flutter/material.dart';

class QuranTextWidget extends StatelessWidget {
  const QuranTextWidget({super.key, required this.fontSizeChanged});
  final ValueNotifier<double> fontSizeChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.6,
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: fontSizeChanged,
              builder: (context, value, child) {
                return Text(
                  'sadasdasdasdasdasdasdasd,asdasdasdasdas,asdasdadsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd,asddddddddddddddddd,asdddddddddddddddddddd,asdddddddddddddddd,',
                  style: TextStyle(fontSize: fontSizeChanged.value),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
