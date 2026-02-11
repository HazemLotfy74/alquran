class AzkarCategoryModel {
  final int id;
  final String title;
  final String? audioUrl;
  final String textUrl;

  AzkarCategoryModel({
    required this.id,
    required this.title,
    required this.textUrl,
    this.audioUrl,
  });

  factory AzkarCategoryModel.fromJson(Map<String, dynamic> json) {
    return AzkarCategoryModel(
      id: (json['ID'] as num).toInt(),
      title: json['TITLE'] ?? '',
      audioUrl: json['AUDIO_URL'],
      textUrl: json['TEXT'] ?? '',
    );
  }
}
