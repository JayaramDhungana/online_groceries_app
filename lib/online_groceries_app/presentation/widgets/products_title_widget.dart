import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

RPadding productsTitleWidget({required String productsTitle,
required void Function()? onTap
}) {
  return RPadding(
    padding: const EdgeInsets.only(top: 30, left: 24.71),
    child: Row(
      children: [
        SizedBox(
          height: 29.h,
          // width: 161.w,
          child: Text(
            productsTitle,
            style: TextStyle(
              fontFamily: 'Gilory',
              color: Color(0xFF181725),
              fontSize: 24.sp,
              height: 1.h,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
            ),
          ),
        ),
        Spacer(),
        InkWell(
          onTap:onTap ,
          child: Padding(
            padding: const EdgeInsets.only(right: 25.29),
            child: SizedBox(
              height: 20.h,
              width: 50.w,
              child: Text(
                "See all",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  color: Color(0xFF53B175),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
