import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Ink bottomSheetWidget({required String titleText, required String subTittle}) {
  return Ink(
    child: Ink(
      height: 62.h,
      child: Ink(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
              InkWell(
                borderRadius: BorderRadius.circular(19.r),
                onTap: () {},
                child: SizedBox(
                  // color: Colors.red,
                  height: 40.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Text ko lagi sizedBox
                      RPadding(
                        padding: const EdgeInsets.only(
                          // top: 20,
                          left: 25.01,
                          // bottom: 20,
                        ),
                        child: Text(
                          titleText,
                          style: TextStyle(
                            fontFamily: 'Gilory',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            letterSpacing: 0,
                            color: Color(0xFF7C7C7C),
                            height: (18 / 18).h,
                          ),
                        ),
                      ),
                      Spacer(),
                      //SUbtitle ra Back arrow ko lagi SizedBox
                      Padding(
                        padding: const EdgeInsets.only(
                          // top: 21,
                          right: 25,
                          // bottom: 21
                        ),
                        child: Row(
                          children: [
                            subTittle.isEmpty
                                ? Image(
                                  image: AssetImage("assets/payment_card.png"),
                                )
                                : Text(
                                  subTittle,
                                  style: TextStyle(
                                    fontFamily: 'Gilory',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    height: (16 / 16).h,
                                    letterSpacing: 0,
                                  ),
                                ),
                            SizedBox(width: 5),
                            Image(image: AssetImage("assets/back arrow.png")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              SizedBox(height: 10.h),
              Container(height: 1.h, width: 363.99.w, color: Color(0xFFE2E2E2)),
            ],
          ),
        ),
      ),
    ),
  );
}
