class ApiUrl {
  static const quranApi = 'https://api.alquran.cloud/v1/quran';
  static const surahAudioApi =
      'https://api.quran.com/api/v4/chapter_recitations/';

  static String azkarApiCategory(int categoryId) {
    return 'https://www.hisnmuslim.com/api/ar/$categoryId.json';
  }
  static String azkarApi='https://www.hisnmuslim.com/api/ar/husn_ar.json';

}
