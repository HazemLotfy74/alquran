import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatLocalizedTime(DateTime dateTime) {
  final hourMinute = DateFormat('hh:mm').format(dateTime);
  final isAm = dateTime.hour < 12;

  return '$hourMinute ${isAm ? 'am'.tr : 'pm'.tr}';
}
