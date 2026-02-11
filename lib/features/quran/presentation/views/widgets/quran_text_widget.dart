import 'package:alquran/core/entities/ayah_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/storage_keys.dart';
import '../../../../../core/cubits/quran_cubit/quran_cubit.dart';

class QuranTextWidget extends StatefulWidget {
  const QuranTextWidget({
    super.key,
    required this.fontSizeChanged,
    required this.ayah,
    required this.surahNumber,
  });
  final ValueNotifier<double> fontSizeChanged;
  final List<AyahEntity> ayah;
  final int surahNumber;

  @override
  State<QuranTextWidget> createState() => _QuranTextWidgetState();
}

class _QuranTextWidgetState extends State<QuranTextWidget> {
  late ScrollController scrollController;
  int currentAyah = 1;
  double lastOffset = 0;
  late QuranCubit cubit;
  late List<GlobalKey> ayahKeys;

  @override
  void initState() {
    super.initState();
    ayahKeys = List.generate(widget.ayah.length, (index) => GlobalKey());
    cubit = context.read<QuranCubit>();
    scrollController = ScrollController();

    scrollController.addListener(() {
      lastOffset = scrollController.offset;
      for (int i = 0; i < ayahKeys.length; i++) {
        final context = ayahKeys[i].currentContext;
        if (context == null) continue;
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);

        if (position.dy > 0) {
          currentAyah = widget.ayah[i].numberInSurah;
          break;
        }
      }
    });

    final offset =
        (cubit.localStorageService.get(
                  StorageKeys.lastRead,
                  StorageKeys.scrollOffset,
                ) ??
                0)
            .toDouble();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(offset);
    });
    currentAyah =
        cubit.localStorageService.get<dynamic>(
          StorageKeys.lastRead,
          StorageKeys.ayah,
        ) ??
        1;
  }

  @override
  void dispose() {
    cubit.saveLastRead(widget.surahNumber, currentAyah, lastOffset);
    scrollController.dispose();
    super.dispose();
  }

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
            controller: scrollController,
            child: ValueListenableBuilder(
              valueListenable: widget.fontSizeChanged,
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(widget.ayah.length, (index) {
                    final ayah = widget.ayah[index];
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
                                fontSize: widget.fontSizeChanged.value,
                                height: 2,
                                color: Colors.black,
                                fontFamily: 'Amiri',
                                decoration: hasSajda
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: '﴿${_toArabicNumber(ayah.numberInSurah)}﴾ ',
                              style: TextStyle(
                                fontSize: widget.fontSizeChanged.value - 4,
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
              },
            ),
          ),
        ),
      ),
    );
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
