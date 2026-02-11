import 'package:flutter/material.dart';

OutlineInputBorder buildOutlineInputBorder({double? radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 4),
    borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
  );
}
