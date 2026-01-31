import '../enums/RevelationType.dart';

extension RevelationTypeMapper on String {
  RevelationType toRevelationType() {
    switch (this) {
      case 'Meccan':
        return RevelationType.Meccan;
      case 'Medinan':
        return RevelationType.Medinan;
      default:
        throw Exception('Unknown RevelationType: $this');
    }
  }
}
