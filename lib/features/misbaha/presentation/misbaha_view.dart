import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/cubit/sibha_cubit.dart';
import 'views/misbaha_view_body.dart';

class MisbahaView extends StatelessWidget {
  const MisbahaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SibhaCubit(),
      child: Scaffold(body: MisbahaViewBody()),
    );
  }
}
