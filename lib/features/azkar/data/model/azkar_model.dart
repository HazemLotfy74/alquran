import '../../domain/entities/azkar_entity.dart';

class AzkarModel extends AzkarTypeEntity {
  const AzkarModel({
    required super.id,
    required super.arabicText,
    required super.repeat,
    super.audio,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      id: json['ID'],
      arabicText: json['ARABIC_TEXT'],
      repeat: json['REPEAT'],
      audio: json['AUDIO'],
    );
  }
}
