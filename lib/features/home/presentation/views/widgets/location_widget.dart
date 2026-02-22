import 'dart:developer';

import 'package:alquran/core/cubits/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationLoading) {
          return Skeletonizer(
            child: Container(width: 50, color: Colors.grey.shade200),
          );
        }
        if (state is LocationError) {
          return Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.orangeAccent.shade100,
            ),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.warning_amber, color: Colors.red),
                Text(state.message),
              ],
            ),
          );
        }
        if (state is LocationSuccess) {
          log(state.locationEntity.city ?? 'no city');
          return SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.location_on_sharp, color: AppColors.primaryColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: state.locationEntity.address ?? '',
                          style: AppTextStyle.bold15,
                        ),
                        const TextSpan(text: ' , '),
                        TextSpan(
                          text: state.locationEntity.city ?? '',
                          style: AppTextStyle.bold15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Text('error');
      },
    );
  }
}
