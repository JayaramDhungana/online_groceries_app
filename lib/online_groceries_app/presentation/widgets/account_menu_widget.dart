import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InkWell accountMenuWidget({
  required ImageProvider<Object> leadingImage,
  required String title,
}) {
  return InkWell(
    child: Ink(
      height: 62,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFE2E2E2)),
          bottom: BorderSide(color: Color(0xFFE2E2E2)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 26.51,
          top: 20,
          bottom: 20,
          right: 25.24,
        ),
        child: Ink(
          width: 362.25,
          height: 22.h,
          child: Row(
            children: [
              Image(image: leadingImage, height: 20.h, width: 18.w),
              SizedBox(width: 20.49),
              Text(
                title,
                style: TextStyle(
                  fontFamily: "Gilory",
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  letterSpacing: 0,
                  height: (18 / 18).h,
                  color: Color(0xFF181725),
                ),
              ),
              Spacer(),
              RPadding(
                padding: const EdgeInsets.only(right: 25.24),
                child: Image(
                  image: AssetImage("assets/back arrow.png"),
                  height: 14.h,
                  width: 8.4.w,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
