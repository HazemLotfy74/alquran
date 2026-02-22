import 'package:alquran/features/azkar/presentation/views/widgets/azkar_view_body.dart';
import 'package:alquran/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/datasources/azkar_remote_data_source_impl.dart';
import '../cubit/azkar_categories_cubit.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final client = http.Client();
        final remote = AzkarRemoteDataSourceImpl(client: client);
        final cubit = AzkarCategoriesCubit(remote);
        cubit.fetchCategories();
        return cubit;
      },
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'الأذكار و الأدعية'),
        body: const AzkarViewBody(),
      ),
    );
  }
}
