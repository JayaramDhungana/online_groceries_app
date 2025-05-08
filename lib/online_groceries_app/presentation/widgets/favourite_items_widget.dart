import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox favouriteItemsWidget({
  required ImageProvider<Object> image,
  required String productName,
  required String productPieces,
  required double productPrice,
}) {
  return SizedBox(
    height: 114.95.h,
    width: 413.w,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 15),
                child: SizedBox(
                  height: 41.83.h,
                  width: 60.w,
                  child: Image(
                    image: image,
                    fit: BoxFit.fitHeight,
                    height: 54.9.h,
                    width: 30.91.w,
                  ),
                ),
              ),
              SizedBox(width: 30.w),
              SizedBox(
                width: 283.w,
                height: 41.83.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Product Name ko Lagi Sized Box
                        SizedBox(
                          height: 18.h,
                          width: 137.02.w,
                          child: Text(
                            productName,
                            style: TextStyle(
                              fontFamily: 'Gilory',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              height: (18 / 16).h,
                              letterSpacing: 0.1,
                              color: Color(0xFF181725),
                            ),
                          ),
                        ),

                        //Product Pieces ko lagi
                        SizedBox(
                          width: 76.w,
                          height: 18.h,
                          child: Text(
                            "$productPieces,Price",
                            style: TextStyle(
                              fontFamily: 'Gilory',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              height: (18 / 14).h,
                              letterSpacing: 0.1,
                              color: Color(0xFF7C7C7C),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    //For Product Price and Back Arrow
                    SizedBox(
                      height: 27.h,
                      // width: 62.4.w,
                      child: Row(
                        children: [
                          Text(
                            "\$$productPrice",
                            style: TextStyle(
                              fontFamily: 'Gilory',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              height: (27 / 16).h,
                              letterSpacing: 0.1,
                              color: Color(0xFF181725),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Image(
                            image: AssetImage("assets/back arrow.png"),
                            color: Color(0xFF181725),
                            height: 14.h,
                            width: 8.4.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ), //product Image Bahekko Row
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            height: 1.h,
            width: 363.6.w,
            color: Color(0xFFE2E2E2),
          ),
        ),
      ],
    ),
  );
}
