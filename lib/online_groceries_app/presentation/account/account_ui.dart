import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/account_menu_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/account_show_dialog_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/log_out_button_widget.dart';

class AccountUi extends StatefulWidget {
  const AccountUi({super.key});

  @override
  State<AccountUi> createState() => _AccountUiState();
}

class _AccountUiState extends State<AccountUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //For USer Photo,Name and Email
            SizedBox(
              height: 115.31.h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  RPadding(
                    padding: const EdgeInsets.only(
                      top: 20.99,
                      left: 25,
                      bottom: 30,
                      right: 20.16,
                    ),
                    child: Image(
                      image: AssetImage("assets/user_image.png"),
                      height: 63.44.h,
                      width: 63.44.w,
                    ),
                  ),
                  RPadding(
                    padding: const EdgeInsets.only(top: 31.65),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Afsar Hossen",

                              style: TextStyle(
                                fontFamily: 'Gilory',
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                height: (20 / 18).h,
                                letterSpacing: 0,
                                color: Color(0xFF181725),
                              ),
                            ),
                            SizedBox(width: 10.15.w),
                            Image(
                              image: AssetImage("assets/edit_icon.png"),
                              height: 15.h,
                              width: 15.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "Imshuvo97@gmail.com",
                          style: TextStyle(
                            fontFamily: "Gilory",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            height: (16 / 18).h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //For other Menus
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "Your Order",
                  detail: "Your order count is 5",
                );
              },
              leadingImage: AssetImage("assets/Orders icon.png"),
              title: "Orders",
            ),
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "Your Details",
                  detail: "Your Name is Afsar Hossen",
                );
              },
              leadingImage: AssetImage("assets/My Details icon.png"),
              title: "My Details",
            ),
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "Delivery Address",
                  detail: "alkjsdhflakdsjfkkasdklfh",
                );
              },
              leadingImage: AssetImage("assets/Delicery address.png"),
              title: "Delivery Address",
            ),
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "Payment Methods",
                  detail: "adfaldkjf asdflkjasf asldkfja ",
                );
              },
              leadingImage: AssetImage("assets/payment_methods.png"),
              title: "Payment Methods",
            ),
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "Promo Card",
                  detail: "askdjfh adkjfh alakjdhf ",
                );
              },
              leadingImage: AssetImage("assets/promo_card_icon.png"),
              title: "Promo Cord",
            ),
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "Notifications",
                  detail: "aksjhdffl askldfjh laksjdhf",
                );
              },
              leadingImage: AssetImage("assets/bell_icon.png"),
              title: "Notifications",
            ),
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "Help",
                  detail: "ALSDKJFH ALSKDJHF ",
                );
              },
              leadingImage: AssetImage("assets/help_icon.png"),
              title: "Help",
            ),
            accountMenuWidget(
              onTap: () {
                accountShowDialogWidget(
                  context: context,
                  title: "About ",
                  detail: "App Version is 2.1.0",
                );
              },
              leadingImage: AssetImage("assets/about_icon.png"),
              title: "About",
            ),
            RPadding(
              padding: const EdgeInsets.only(top: 52.33),
              child: InkWell(
                borderRadius: BorderRadius.circular(19.r),
                onTap: () {},
                child: logOutButtonWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
