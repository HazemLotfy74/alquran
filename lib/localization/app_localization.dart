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
      'meccan': 'Meccan',
      'medinan': 'Medinan',
      'Something went wrong': 'Something went wrong',
      'No results found': 'No results found',
      'Enable your location': 'Enable your location',
      'Location permission denied': 'Location permission denied',
      'Error initialize location': 'Error initialize location',
    },
    'ar': {
      'Enable your location': 'الرجاء قم بتفعيل خدمات الموقع',
      'Location permission denied': 'تم رفض اذن الوصول للموقع الحالي',
      'Error initialize location': 'خطأ فى تحديد الموقع الحالي',
      'No results found': 'لا توجد نتائج',
      'Something went wrong': 'حدث خطأ ما',
      'meccan': 'مكية',
      'medinan': 'مدنية',
      'Surahs': 'السور',
      'am': 'صباحًا',
      'pm': 'مساءً',
      'Zoom In': 'تكبير',
      'Zoom Out': 'تصغير',
    },
  };
}
