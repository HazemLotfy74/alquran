import 'package:alquran/features/quran/domain/entities/ayah_entity.dart';
import 'package:flutter/material.dart';

class QuranTextWidget extends StatelessWidget {
  const QuranTextWidget({
    super.key,
    required this.fontSizeChanged,
    required this.ayah,
  });
  final ValueNotifier<double> fontSizeChanged;
  final List<AyahEntity> ayah;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.6,
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: fontSizeChanged,
              builder: (context, value, child) {
                return RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(children: _buildAyahs(fontSizeChanged.value)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildAyahs(double fontSize) {
    return ayah.map((ayah) {
      return TextSpan(
        children: [
          TextSpan(
            text: '${ayah.text} ',
            style: TextStyle(
              fontSize: fontSize,
              height: 2,
              color: Colors.black,
              fontFamily: 'Amiri', // 👈 مهم
            ),
          ),

          /// رقم الآية
          TextSpan(
            text: '﴿${ayah.numberInSurah}﴾ ',
            style: TextStyle(
              fontSize: fontSize - 4,
              color: Colors.black54,
              fontFamily: 'Amiri',
            ),
          ),
        ],
      );
    }).toList();
  }

  String _toArabicNumber(int number) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number
        .toString()
        .split('')
        .map((e) => arabicNumbers[int.parse(e)])
        .join();
  }
}
