import 'package:alquran/core/entities/ayah_entity.dart';
import 'package:alquran/core/entities/surah_entity.dart';
import 'package:alquran/features/quran/presentation/views/widgets/ayah_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/quran_cubit/quran_cubit.dart';

class QuranTextWidget extends StatefulWidget {
  const QuranTextWidget({
    super.key,
    required this.fontSizeChanged,
    required this.ayah,
    required this.surahEntity,
  });

  final ValueNotifier<double> fontSizeChanged;
  final List<AyahEntity> ayah;
  final SurahEntity surahEntity;

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
    cubit.loadLastRead(surahEntity: widget.surahEntity);
    scrollController = ScrollController();

    scrollController.addListener(() {
      lastOffset = scrollController.offset;
      getAyahScrollOffset();
    });

    final lastRead = cubit.lastReadModel;

    if (lastRead != null) {
      currentAyah = lastRead.ayahNumber;
      widget.fontSizeChanged.value = lastRead.fontSize;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.jumpTo(lastRead.scrollOffset);
      });
    }
  }

  void getAyahScrollOffset() {
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
  }

  @override
  void dispose() {
    cubit.saveLastRead(
      ayahNumber: currentAyah,
      scrollOffset: lastOffset,
      fontSize: widget.fontSizeChanged.value,
      surahEntity: widget.surahEntity,
    );

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
                return AyahTextWidget(
                  ayahs: widget.ayah,
                  ayahKeys: ayahKeys,
                  fontSize: widget.fontSizeChanged.value,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
