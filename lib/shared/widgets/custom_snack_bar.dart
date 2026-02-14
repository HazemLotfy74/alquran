import 'package:alquran/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar(
  BuildContext context, {
  required String message,
  Color? color,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message.tr,
        style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
      ),
      backgroundColor: color,
      duration: duration ?? Duration(seconds: 4),
    ),
  );
}
