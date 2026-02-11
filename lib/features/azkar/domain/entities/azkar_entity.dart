class AzkarTypeEntity {
  final int id;
  final String arabicText;
  final int repeat;
  final String? audio;

  const AzkarTypeEntity({
    required this.id,
    required this.arabicText,
    required this.repeat,
    this.audio,
  });
}
