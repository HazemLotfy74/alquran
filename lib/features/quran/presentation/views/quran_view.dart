import 'package:alquran/features/quran/domain/repo/quran_repo.dart';
import 'package:alquran/features/quran/presentation/manager/cubit/quran_cubit.dart';
import 'package:alquran/features/quran/presentation/views/widgets/quran_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuranCubit(quranRepo: getIt.get<QuranRepo>())..getSurahs(),
      child: Scaffold(body: SafeArea(child: QuranViewBody())),
    );
  }
}
