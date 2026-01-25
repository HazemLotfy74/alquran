import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {'am': 'AM', 'pm': 'PM'},
    'ar': {'am': 'صباحًا', 'pm': 'مساءً'},
  };
}
