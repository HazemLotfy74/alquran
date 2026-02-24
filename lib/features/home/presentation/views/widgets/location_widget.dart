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
        if (state is LocationSuccess) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.primaryColor, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.location_on_sharp, color: AppColors.primaryColor),
                Text.rich(
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
              ],
            ),
          );
        }
        return Text('error');
      },
    );
  }
}
