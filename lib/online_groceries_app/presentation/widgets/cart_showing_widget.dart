import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/cart_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/plus_or_minus_button_widget.dart';
import 'dart:math' as math;

Column cartShowingWidget({
  required ImageProvider<Object> productImage,
  required String productName,
  required String productPieces,
  required String productPrice,
  required int productIndex,
  required int productCount,
  required WidgetRef ref,
}) {
  double count = 10.0000;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RPadding(
        padding: const EdgeInsets.only(left: 25.27, top: 30),
        child: SizedBox(
          height: 96.98.h,
          width: 363.73.w,
          child: Row(
            children: [
              Image(image: productImage, height: 64.96.h, width: 70.43.w),
              SizedBox(width: 32.71.w),
              Container(
                // color: Colors.red,
                height: 96.98.h,
                width: 260.59.w,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //This Sized Box is only for Product Name
                        SizedBox(
                          height: 18.h,
                          // width: 137.02.w,
                          child: Text(
                            productName,
                            style: TextStyle(
                              fontFamily: 'Gilory',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              height: (16 / 18).h,
                              letterSpacing: 0.1,
                              color: Color(0xFF181725),
                            ),
                          ),
                        ),
                        Spacer(),
                        //This is for Remove Cart Item
                        InkWell(
                          onTap: () {
                            ref
                                .read(cartProvider)
                                .removeProductFromCount(productIndex);
                          },
                          child: Hero(
                            tag: productName,
                            child: Image(
                              image: AssetImage("assets/close_icon.png"),
                              height: 14.h,
                              width: 14.16.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //This is For product Pieces
                    RPadding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 14.89.h,
                            // width: 72.27.w,
                            child: Text(
                              "$productPieces,Price",
                              style: TextStyle(
                                color: Color(0xFF7C7C7C),
                                fontFamily: 'Gilory',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: (14 / 18).h,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //THis Sized Box is for Plus ,Minus Button and Count
                    Row(
                      children: [
                        RPadding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SizedBox(
                            height: 47.08.h,
                            width: 133.24.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //THis is minus Button
                                plusOrMinusButtonWidget(
                                  image: Image(
                                    image: AssetImage("assets/minus_icon.png"),
                                    height: 2.84.h,
                                    width: 17.w,
                                  ),

                                  onTap: () {
                                    ref
                                        .read(cartProvider)
                                        .decreaseCount(
                                          indexFromUI: productIndex,
                                        );
                                  },
                                ),
                                //This SizedBox is for Count Showing
                                RPadding(
                                  padding: const EdgeInsets.only(
                                    top: 19.33,
                                    left: 17.45,
                                    bottom: 9.75,
                                    right: 17.45,
                                  ),
                                  child: SizedBox(
                                    height: 18.h,
                                    width: 7.w,
                                    child: Text(
                                      productCount.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Gilory',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        height: (16 / 18).h,
                                        letterSpacing: 0.1,
                                        color: Color(0xFF181725),
                                      ),
                                    ),
                                  ),
                                ),

                                //This is For Plus Icon
                                plusOrMinusButtonWidget(
                                  image: Image(
                                    image: AssetImage("assets/plus_icon.png"),
                                  ),
                                  onTap: () {
                                    ref
                                        .read(cartProvider)
                                        .increaseCount(
                                          indexFromUI: productIndex,
                                        );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        //This is for Product ko Price
                        SizedBox(
                          height: 27.h,

                          child: Text(
                            "\$ ${double.parse(productPrice).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontFamily: 'Gilory',
                              color: Color(0xFF181725),
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              height: (18 / 27).h,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //This is for lasko Divider
      SizedBox(height: 30.03.h),
      Center(
        child: Container(height: 1.h, width: 363.6.w, color: Color(0xFFE2E2E2)),
      ),
    ],
  );
}
