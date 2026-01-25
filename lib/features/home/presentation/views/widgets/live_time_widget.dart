import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/functions/getLocalizedTime.dart';
import '../../../../../core/utils/app_text_style.dart';

class LiveTimeWidget extends StatefulWidget {
  const LiveTimeWidget({super.key});

  @override
  State<LiveTimeWidget> createState() => _LiveTimeWidgetState();
}

class _LiveTimeWidgetState extends State<LiveTimeWidget> {
  late Timer timer;
  ValueNotifier<DateTime> dateTime = ValueNotifier(DateTime.now());
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      dateTime.value = DateTime.now();
    });
  }

  @override
  void dispose() {
    dateTime.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dateTime,
      builder: (context, value, child) {
        return Text(
          formatLocalizedTime(value),
          style: AppTextStyle.bold15.copyWith(color: Colors.white),
        );
      },
    );
  }
}
