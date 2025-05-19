import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/user_information_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/account_menu_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/account_show_dialog_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/log_out_button_widget.dart';

class AccountUi extends ConsumerStatefulWidget {
  const AccountUi({super.key});

  @override
  ConsumerState<AccountUi> createState() => _AccountUiState();
}

class _AccountUiState extends ConsumerState<AccountUi> {
  var formKey = GlobalKey<FormState>();

  final userNameFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textControllerFroUsername = TextEditingController(
      text: ref.watch(userInformationProvider).userName,
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                                ref.watch(userInformationProvider).userName,

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
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        title: Text("Edit your Name"),
                                        children: [
                                          RPadding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Form(
                                              key: formKey,
                                              child: TextFormField(
                                                focusNode: userNameFocusNode,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "User Name Should Not be Emplty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                controller:
                                                    textControllerFroUsername,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15.r,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Center(
                                            child: bigButtonWidget(
                                              width: 100,
                                              height: 50,
                                              color: Color(0xFF53B175),
                                              radius: 19.r,
                                              text: Text("Update"),
                                              onTap: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  ref
                                                      .read(
                                                        userInformationProvider,
                                                      )
                                                      .editName(
                                                        userNameFromUI:
                                                            textControllerFroUsername
                                                                .text,
                                                      );
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/edit_icon_svg.svg",
                                  height: 15.h,
                                  width: 15.w,
                                ),
                                // Image(
                                //   image: AssetImage("assets/edit_icon.png"),
                                //   height: 15.h,
                                //   width: 15.w,
                                // ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            ref.watch(userInformationProvider).email,
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
                leadingImage: "assets/Orders icon.svg",
                // AssetImage("assets/Orders icon.png"),
                title: "Orders",
              ),
              accountMenuWidget(
                onTap: () {
                  accountShowDialogWidget(
                    context: context,
                    title: "Your Details",
                    detail:
                        "Name:${ref.watch(userInformationProvider).userName}\nEmail:${ref.watch(userInformationProvider).email}",
                  );
                },
                leadingImage: "assets/My Details icon.svg",
                // AssetImage("assets/My Details icon.png"),
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
                leadingImage: "assets/Delicery address.svg",
                //  AssetImage("assets/Delicery address.png"),
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
                leadingImage: "assets/payments_methods_svg.svg",
                //  AssetImage("assets/payment_methods.png"),
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
                leadingImage: "assets/promo_cord.svg",
                // AssetImage("assets/promo_card_icon.png"),
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
                leadingImage: "assets/bell_icon_svg.svg",
                // AssetImage("assets/bell_icon.png"),
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
                leadingImage: "assets/help_icon_svg.svg",
                // AssetImage("assets/help_icon.png"),
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
                leadingImage: "assets/about_icon_svg.svg",
                // AssetImage("assets/about_icon.png"),
                title: "About",
              ),
              RPadding(
                padding: const EdgeInsets.only(top: 52.33),
                child: InkWell(
                  borderRadius: BorderRadius.circular(19.r),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(),
                      ),
                    );
                  },
                  child: logOutButtonWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
