import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

InkWell plusOrMinusButtonWidget({
  required String image,
  required void Function()? onTap,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(17.r),
    onTap: onTap,
    child: Ink(
      height: 45.67.h,
      width: 45.67.w,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(17.r),
        border: Border.all(color: Color(0xFFF0F0F0)),
      ),
      child: Center(
        child:SvgPicture.asset(image)
        ),
    ),
  );
}
