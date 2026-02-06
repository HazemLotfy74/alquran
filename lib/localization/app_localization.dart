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
      'Meccan': 'Meccan',
      'Medinan': 'Medinan',
      'Something went wrong': 'Something went wrong',
      'No results found': 'No results found',
    },
    'ar': {
      'No results found': 'لا توجد نتائج',
      'Something went wrong': 'حدث خطأ ما',
      'Meccan': 'مكية',
      'Medinan': 'مدنية',
      'Surahs': 'السور',
      'am': 'صباحًا',
      'pm': 'مساءً',
      'Zoom In': 'تكبير',
      'Zoom Out': 'تصغير',
    },
  };
}
