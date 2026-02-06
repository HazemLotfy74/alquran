import '../entities/surah_entity.dart';
import '../enums/revelation_type.dart';

SurahEntity getDummyData() {
  return SurahEntity(
    number: 0,
    name: '',
    englishName: '',
    englishNameTranslation: '',
    revelationType: RevelationType.medinan,
    ayahs: [],
  );
}
