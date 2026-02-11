import 'package:alquran/shared/widgets/custom_outline_border.dart';
import 'package:alquran/features/listen_to_quran/domain/entities/drop_down_menu_entity.dart';
import 'package:alquran/features/listen_to_quran/presentation/manager/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDownMenuButton extends StatelessWidget {
  CustomDropDownMenuButton({super.key, required this.reciterId});
  final List<DropDownMenuEntity> items = [
    DropDownMenuEntity(value: 2, name: 'عبد الباسط عبد الصمد'),
    DropDownMenuEntity(value: 19, name: 'احمد ابن علي العجمي'),
    DropDownMenuEntity(value: 9, name: 'صديق المنشاوي'),
    DropDownMenuEntity(value: 6, name: 'خليل الحصري'),
    DropDownMenuEntity(value: 13, name: 'سعد الغامدي'),
    DropDownMenuEntity(value: 20, name: 'عبد الرحمن السديس و سعود الشريم'),
    DropDownMenuEntity(value: 65, name: 'ماهر المعيقلي'),
    DropDownMenuEntity(value: 88, name: 'مصطفي اسماعيل'),
    DropDownMenuEntity(value: 91, name: 'محمد محمود الطبلاوي'),
    DropDownMenuEntity(value: 97, name: 'ياسر الدوسري'),
    DropDownMenuEntity(value: 7, name: 'مشاري العفاسي'),
  ];
  final ValueChanged<int> reciterId;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items.map((e) {
        return DropdownMenuItem(value: e.value, child: Text(e.name));
      }).toList(),
      onChanged: (value) {
        reciterId(value!);
        context.read<AudioCubit>().reciterID = value;
      },
      decoration: InputDecoration(
        label: Text('القارئ'),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
      ),
    );
  }
}
