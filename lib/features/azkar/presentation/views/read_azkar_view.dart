import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alquran/shared/widgets/custom_app_bar.dart';
import 'package:alquran/features/azkar/presentation/views/widgets/read_azkar_view_body.dart';
import 'package:alquran/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:alquran/features/azkar/presentation/cubit/azkar_state.dart';

class ReadAzkarView extends StatefulWidget {
  const ReadAzkarView({
    super.key,
    required this.categoryId,
  });

  // ✅ now we receive categoryId, not entity
  final int categoryId;

  @override
  State<ReadAzkarView> createState() => _ReadAzkarViewState();
}

class _ReadAzkarViewState extends State<ReadAzkarView> {
  @override
  void initState() {
    super.initState();

    // ✅ fetch azkar when page opens
    context.read<AzkarCubit>().fetchAzkar(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        final title =
        state is AzkarLoaded ? state.data.title : '...';

        return Scaffold(
          appBar: buildAppBar(
            context: context,
            title: title,
          ),
          body: const ReadAzkarViewBody(),
        );
      },
    );
  }
}
