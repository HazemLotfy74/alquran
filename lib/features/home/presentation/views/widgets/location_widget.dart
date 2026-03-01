import 'package:alquran/core/cubits/location_cubit/location_cubit.dart';
import 'package:alquran/features/home/presentation/views/widgets/location_error_widget.dart';
import 'package:alquran/features/home/presentation/views/widgets/location_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
          return LocationErrorWidget(errMsg: state.message);
        }
        if (state is LocationSuccess) {
          return LocationSuccessWidget(locationEntity: state.locationEntity);
        }
        return Text('Something went wrong'.tr);
      },
    );
  }
}
