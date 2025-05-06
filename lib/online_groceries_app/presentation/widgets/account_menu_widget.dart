import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InkWell accountMenuWidget({
  required ImageProvider<Object> leadingImage,
  required String title,
  required void Function()? onTap,
}) {
  return InkWell(
    // onTap: onTap,
    child: Container(
      child: Ink(
        height: 62,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFE2E2E2)),
            bottom: BorderSide(color: Color(0xFFE2E2E2)),
          ),
        ),
        child: RPadding(
          padding: const EdgeInsets.only(
            top: 7,
            bottom: 7,
            left: 10,
            right: 10,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(19.r),
            onTap: onTap,
            child: Ink(
              // color: Colors.red,
              height: 60,
              child: RPadding(
                padding: const EdgeInsets.only(
                  left: 16.51,
                  right: 15.24,
                  bottom: 13,
                  top: 13,
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
                      Image(
                        image: AssetImage("assets/back arrow.png"),
                        height: 14.h,
                        width: 8.4.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
