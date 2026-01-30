import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'am': 'AM',
      'pm': 'PM',
      'Zoom In': 'Zoom In',
      'Zoom Out': 'Zoom Out',
      'Surahs': 'Surahs',
    },
    'ar': {
      'Surahs': 'السور',
      'am': 'صباحًا',
      'pm': 'مساءً',
      'Zoom In': 'تكبير',
      'Zoom Out': 'تصغير',
    },
  };
}
