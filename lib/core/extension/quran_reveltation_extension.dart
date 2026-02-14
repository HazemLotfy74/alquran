import '../enums/revelation_type.dart';

extension RevelationTypeMapper on String {
  RevelationType toRevelationType() {
    switch (this) {
      case 'Meccan':
        return RevelationType.meccan;
      case 'Medinan':
        return RevelationType.medinan;
      default:
        throw Exception('Unknown RevelationType: $this');
    }
  }
}
