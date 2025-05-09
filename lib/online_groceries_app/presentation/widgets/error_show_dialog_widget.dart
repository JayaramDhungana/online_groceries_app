import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/bottom_navigation_bar/Bottom_Navigation_Bar_Screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/bottom_nav_bar_provider.dart';

Dialog erroShowDialogWidget({
  required WidgetRef ref,
  required BuildContext context,
  required void Function()? onTap
}) {
  return Dialog(
    backgroundColor: Color(0xFFFFFFFF),
    child: Container(
      height: 601.93.h,
      width: 364.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26.98, left: 25.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //This is Close Icon of Above
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image(
                    image: AssetImage("assets/close_icon_black.png"),
                    height: 15.53.h,
                    width: 15.71.w,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RPadding(
              padding: const EdgeInsets.only(top: 18.47),
              child: Image(
                image: AssetImage("assets/error_image.png"),
                height: 221.85.h,
                width: 222.35.w,
              ),
            ),
          ),
          //This sized box is for Text
          RPadding(
            padding: const EdgeInsets.only(top: 49.18),
            child: SizedBox(
              height: 34.h,
              width: 245.w,
              child: Text(
                "Oops! Order Failed",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.w600,
                  fontSize: 28.sp,
                  height: (28 / 28).h,
                  letterSpacing: 0,
                  color: Color(0xFF181725),
                ),
              ),
            ),
          ),

          RPadding(
            padding: const EdgeInsets.only(top: 20.71),
            child: SizedBox(
              height: 21.h,
              width: 229.w,
              child: Text(
                "Something went tembly wrong.",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: (16 / 21).h,
                  letterSpacing: 0,
                  color: Color(0xFF7C7C7C),
                ),
              ),
            ),
          ),

          RPadding(
            padding: const EdgeInsets.only(top: 60.51),
            child: bigButtonWidget(
              width: 313.w,
              height: 67.h,
              color: Color(0xFF53B175),
              radius: 19.r,
              text: Text(
                "Please Try Again",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: (18 / 18).h,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
          ),
          bigButtonWidget(
            width: 313.w,
            height: 67.h,
            color: Colors.white,
            radius: 19.r,
            text: Text(
              "Back to home",
              style: TextStyle(
                fontFamily: 'Gilory',
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                height: (18 / 18).h,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
            onTap: onTap,
          ),
        ],
      ),
    ),
  );
}
