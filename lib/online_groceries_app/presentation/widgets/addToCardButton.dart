import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container addToCardButton() {
  return Container(
    width: 45.67.w,
    height: 45.67.h,

    decoration: BoxDecoration(
      color: Colors.white,

      border: Border.all(color: Color(0xFFE2E2E2), width: 1.w),
      borderRadius: BorderRadius.circular(18.r),
    ),
    child: Container(
      width: 45.67.w,
      height: 45.67.h,
      decoration: BoxDecoration(
        color: Color(0xFF00B36F),
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Center(
        child: SizedBox(
          width: 17.w,
          height: 17.h,
          child: SvgPicture.asset("assets/plus_icon_svg.svg"),
          // Image(image: AssetImage("assets/add_image.png")),
        ),
      ),
    ),
  );
}
