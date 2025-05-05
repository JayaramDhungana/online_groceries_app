import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Ink bigButtonWidget({
  required double width,
  required double height,
  required Color color,
  required double radius,
  required Text text,
}) {
  return Ink(
    child: Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(child: text),
    ),
  );
}
