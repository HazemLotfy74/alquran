class ArabicTextUtils {
  static String normalize(String text) {
    return text
        .replaceAll(RegExp(r'^ال'), '')
        // إزالة كل أنواع التشكيل العربية
        .replaceAll(RegExp(r'[\u064B-\u065F\u0670\u0671\u06D6-\u06ED]'), '')
        // توحيد الألف بكل أشكالها + ألف الوصل
        .replaceAll(RegExp(r'[أإآٱ]'), 'ا')
        // توحيد الياء
        .replaceAll('ى', 'ي')
        // توحيد التاء المربوطة
        .replaceAll('ة', 'ه')
        // إزالة التطويل
        .replaceAll('ـ', '')
        // إزالة أي مسافات زيادة
        .replaceAll(RegExp(r'\s+'), '')
        .trim()
        .toLowerCase();
  }
}
