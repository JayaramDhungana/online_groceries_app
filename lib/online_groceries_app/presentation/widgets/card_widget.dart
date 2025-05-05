import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/product_detail_screen/product_detail_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/addToCardButton.dart';

Ink cardWidget({
  required ImageProvider<Object> productImage,
  required String productName,
  required String productPieces,
  required String productPrice,
  required int index,
  context,
}) {
  return Ink(
    width: 173.32.w,
    height: 248.51.h,
    color: Color(0xFFFFFFFF),
    child: Ink(
      width: 173.32.w,
      height: 248.51.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Color(0xFFE2E2E2), width: 1.w),
      ),

      child: Column(
        children: [
          RPadding(
            padding: const EdgeInsets.only(
              top: 25.21,
              left: 33.84,
              right: 39.27,
            ),
            child: SizedBox(
              width: 99.89.w,
              height: 79.43.h,
              //
              child: Hero(
                tag: productName,
                child: Image(image: productImage, fit: BoxFit.contain),
              ),
            ),
          ),
          //For Product Name
          RPadding(
            padding: const EdgeInsets.only(
              left: 14.95,
              top: 25.26,
              right: 21.02,
            ),
            child: SizedBox(
              width: 137.02.w,
              height: 18.h,
              child: Text(
                productName,
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  height: (18 / 18).h,
                  letterSpacing: 0.1,
                  color: Color(0xFF181725),
                ),
              ),
            ),
          ),
          //for product pieces
          RPadding(
            padding: const EdgeInsets.only(left: 14.95, right: 79.55, top: 5),
            child: SizedBox(
              width: 78.5.w,
              height: 14.89.h,
              child: Text(
                "$productPieces,Priceg",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.w400,
                  height: (18 / 18).h,
                ),
              ),
            ),
          ),
          Row(
            children: [
              RPadding(
                padding: const EdgeInsets.only(top: 36.8, left: 15),
                child: SizedBox(
                  width: 52.13.w,
                  height: 18.h,
                  child: Text(
                    "\$$productPrice",
                    style: TextStyle(
                      fontFamily: 'Gilory',
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: (18 / 18).h,
                      letterSpacing: 0.1,
                      color: Color(0xFF181725),
                    ),
                  ),
                ),
              ),
              Spacer(),
              RPadding(
                padding: EdgeInsets.only(top: 20, right: 14),
                child: addToCardButton(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
