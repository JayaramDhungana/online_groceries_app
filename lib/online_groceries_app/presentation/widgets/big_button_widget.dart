import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InkWell bigButtonWidget({
  required double width,
  required double height,
  required Color color,
  required double radius,
  required Text text,
  required void Function()? onTap,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(radius),
    onTap: onTap,
    child: Ink(
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
