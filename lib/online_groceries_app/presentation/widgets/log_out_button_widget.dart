import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Ink logOutButtonWidget() {
  return Ink(
    height: 67.h,
    width: 364.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19.r),
      color: Color(0xFFF2F3F2),
    ),
    child: Row(
      children: [
        RPadding(
          padding: const EdgeInsets.only(top: 24.5, bottom: 24.5, left: 25.17),
          child: Image(image: AssetImage("assets/log_out_icon.png")),
        ),
        // SizedBox(width: 71.71.w),
        Center(
          child: SizedBox(
            width: 304.83,
            child: Center(
              child: Text(
                "Log Out",
                style: TextStyle(
                  fontFamily: "Gilory",
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: (18 / 18).h,
                  letterSpacing: 0,
                  color: Color(0xFF53B175),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
