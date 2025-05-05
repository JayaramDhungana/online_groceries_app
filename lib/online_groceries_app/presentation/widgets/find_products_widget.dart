import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container findProductWidget({
 required ImageProvider<Object> image,
 required String productName,
}) {
  return Container(
    width: 174.5.w,
    height: 189.11.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18.r),
      border: Border.all(
        color: Color(0xFF82C69A),
        width: 1.w
      )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RPadding(
          padding: const EdgeInsets.only(
            left:  31.1,
             top: 27.68,
             right: 32.02,
             bottom: 27.52,
          ),
          child: Image(image:image,
          width: 111.38.w,
          height: 74.9.h,
          ),
        ),
        Text(productName,
        style: TextStyle(
          fontSize: 16.sp,
          height: (16/22).h,
          letterSpacing: 0.1,
          color: Color(0xFF181725),
        ),)
        
      ],
    ),
  );
}
