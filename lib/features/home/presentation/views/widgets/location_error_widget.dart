import 'package:alquran/core/cubits/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_style.dart';

class LocationErrorWidget extends StatelessWidget {
  const LocationErrorWidget({super.key, required this.errMsg});
  final String errMsg;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.orangeAccent.shade100,
      ),
      child: Row(
        spacing: 10,
        children: [
          const Icon(Icons.warning_amber, color: Colors.red),
          Text(errMsg),
          const Spacer(),
          TextButton(
            onPressed: () {
              context.read<LocationCubit>().getLocation();
            },
            child: Text(
              'تشغيل خدمات الموقع',
              style: AppTextStyle.medium14.copyWith(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
