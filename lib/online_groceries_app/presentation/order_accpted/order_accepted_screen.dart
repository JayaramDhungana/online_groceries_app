import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/bottom_navigation_bar/Bottom_Navigation_Bar_Screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/cart/cart_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/bottom_nav_bar_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/error_show_dialog_widget.dart';

class OrderAcceptedScreen extends ConsumerStatefulWidget {
  const OrderAcceptedScreen({super.key});

  @override
  ConsumerState<OrderAcceptedScreen> createState() =>
      _OrderAcceptedScreenState();
}

class _OrderAcceptedScreenState extends ConsumerState<OrderAcceptedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          RPadding(
            padding: const EdgeInsets.only(
              top: 151.7,
              left: 58.38,
              right: 86.37,
            ),
            child: Image(image: AssetImage("assets/order_accepted.png")),
          ),

          RPadding(
            padding: const EdgeInsets.only(
              top: 66.67,
              left: 74.41,
              right: 74.41,
            ),
            child: SizedBox(
              height: 68.h,
              width: 265.w,
              child: Text(
                "Your Order has been accepted",

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.w600,
                  fontSize: 28.sp,
                  height: 1.2.h,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 67.91, right: 67.91),
            child: SizedBox(
              height: 42.h,
              width: 278.w,
              child: Text(
                textAlign: TextAlign.center,
                "Your items has been placed and is on it's way to being processed",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: (21 / 16).h,
                  letterSpacing: 0,
                  color: Color(0xFF7C7C7C),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(),
            child: bigButtonWidget(
              width: 364.w,
              height: 67.h,
              color: Color(0xFF53B175),
              radius: 19.r,
              text: Text(
                "Track Order",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: (18 / 18).h,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return erroShowDialogWidget(
                      context: context,
                      ref: ref,
                      onTap: () {
                        ref.read(bottomNavBarProvider).changeSelectedIndex(2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationBarScreen(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          bigButtonWidget(
            width: 364.w,
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
            onTap: () {
              ref.read(bottomNavBarProvider).changeSelectedIndex(2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationBarScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
