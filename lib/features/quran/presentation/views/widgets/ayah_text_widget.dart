import 'package:alquran/core/entities/ayah_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/functions/string_to_arabic_numbers.dart';

class AyahTextWidget extends StatelessWidget {
  const AyahTextWidget({
    super.key,
    required this.ayahs,
    required this.ayahKeys,
    required this.fontSize,
  });
  final List<AyahEntity> ayahs;
  final List<GlobalKey> ayahKeys;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      textDirection: TextDirection.rtl,
      children: List.generate(ayahs.length, (index) {
        final ayah = ayahs[index];
        final hasSajda = ayah.sajda != false && ayah.sajda != null;
        return Container(
          key: ayahKeys[index],
          padding: const EdgeInsets.only(bottom: 8),
          child: RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${ayah.text} ',
                  style: TextStyle(
                    fontSize: fontSize,
                    height: 2.3,
                    color: Colors.black,
                    fontFamily: 'Amiri',
                    decoration: hasSajda
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: '﴿${toArabicNumber(ayah.numberInSurah)}﴾',
                  style: TextStyle(
                    fontSize: fontSize - 4,
                    color: Colors.black54,
                    fontFamily: 'Amiri',
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
