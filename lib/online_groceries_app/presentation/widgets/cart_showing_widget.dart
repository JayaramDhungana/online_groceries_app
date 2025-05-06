import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

RPadding cartShowingWidget({
  required ImageProvider<Object> productImage,
  required String productName,
}) {
  return RPadding(
    padding: const EdgeInsets.only(left: 25.27, top: 30),
    child: SizedBox(
      height: 96.98.h,
      width: 363.73.w,
      child: Row(
        children: [
          Center(child: Image(image: productImage)),
          SizedBox(width: 32.71),
          Container(
            // color: Colors.red,
            height: 96.98.h,
            // width: 260.59.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text(productName)],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
