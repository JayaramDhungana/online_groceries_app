import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/beverages/beverages_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/beverages_provider.dart';

Ink exploreScreenWidget({
  required Color color,
  required Color boarderColor,
  required ImageProvider<Object> image,
  required String text,
  required Color splashColor,
  required BuildContext context,
  required WidgetRef ref,
}) {
  return Ink(
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      splashColor: splashColor,
      onTap: () {
        ref.read(beveragesProvider).loadBeveragesProducts();

        if (text == "Beverages") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BeveragesScreen()),
          );
        }
      },
      // splashColor: Colors.red,
      child: Ink(
        height: 189.11.h,
        width: 174.5.w,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: boarderColor),
        ),
        child: Column(
          children: [
            RPadding(
              padding: const EdgeInsets.only(
                top: 27.68,
                left: 31.1,
                right: 32.02,
              ),
              child: Image(image: image, width: 111.38.w, height: 74.9.h),
            ),
            RPadding(
              padding: const EdgeInsets.only(
                top: 27.52,

                // left: 41.25,
                // right: 40.25,
                // bottom: 15,
              ),
              child: Center(
                child: Text(
                  text,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Gilory',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: (22 / 16).h,
                    letterSpacing: 0.1,
                    overflow: TextOverflow.ellipsis,
                    color: Color(0xFF181725),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
