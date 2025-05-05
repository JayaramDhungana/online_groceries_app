import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

RPadding groceriesTypeWidget({
  required ImageProvider<Object> image,
  required String text,
  required Color color
}) {
  return RPadding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Container(
      height: 105.h,
      width: 248.19.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: color,
      ),
      child: Row(
        children: [
          RPadding(
            padding: const EdgeInsets.only(
              left: 16.94,
              top: 15.8,
              right: 15,
              bottom: 17.3,
            ),
            child: Image(image: image, height: 71.9.h, width: 71.9.w),
          ),
          RPadding(
            padding: const EdgeInsets.only(top: 40, bottom: 40, right: 86.34),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Gilory',
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                height: 1.h,
                letterSpacing: 0,
                color: Color(0xFF3E423F),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
