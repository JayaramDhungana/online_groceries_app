import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/sign_up/sign_up_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/onboarding_image.png"),
            height: 896.h,
            width: 414.w,
            fit: BoxFit.fill,
          ),
          //Lower Part
          Positioned(
            bottom: 0,
            child: Container(
              height: 441.97.h,
              width: 414.w,
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //for Image of Gajar
                  RPadding(
                    padding: const EdgeInsets.only(
                      top: 31.22,
                      bottom: 35.66,
                      left: 182.76,
                      right: 182.76,
                    ),
                    child: SizedBox(
                      height: 56.36.h,
                      width: 48.47.w,
                      child: Image(
                        image: AssetImage("assets/gajar.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //This is for Text
                  SizedBox(
                    height: 86.h,
                    width: 253.w,
                    child: Column(
                      spacing: 28.h,
                      children: [
                        Text(
                          "Welcome",

                          textAlign: TextAlign.center,
                          style: GoogleFonts.glory(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 48.sp,

                              height: (29 / 48).h,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "to our store",
                          style: GoogleFonts.glory(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 48.sp,
                              height: (29 / 48).h,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RPadding(
                    padding: const EdgeInsets.only(top: 19),
                    child: SizedBox(
                      height: 15.h,
                      width: 295.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Get your grocerries in as fast as one hour",
                        style: GoogleFonts.glory(
                          color: Color(0xFFFCFCFC),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: (15 / 16).h,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  RPadding(
                    padding: EdgeInsets.only(top: 40.88),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF53B175),
                        borderRadius: BorderRadius.circular(19.r),
                      ),

                      child: bigButtonWidget(
                        onTap: () => context.go("/sign_up"),
                        //  {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => SignUpScreen(),
                        //     ),
                        //   );
                        // },
                        color: Color(0xFF53B175),
                        height: 67.h,
                        width: 353.w,
                        radius: 19.r,
                        text: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.glory(
                            color: Color(0xFFFFF9FF),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (18 / 18).h,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
