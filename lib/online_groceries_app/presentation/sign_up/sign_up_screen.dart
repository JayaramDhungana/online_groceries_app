import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/sign_up_Validation_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/home_screen/home_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/sign_up_text_field_widget.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  //text Controllers
  TextEditingController textControllerForUsername = TextEditingController();
  TextEditingController textControllerForEmail = TextEditingController();
  TextEditingController textControllerForPassword = TextEditingController();
  //formkeys
  var formKey = GlobalKey<FormState>();
  var usernameFormKey = GlobalKey<FormFieldState>();
  var emailFormKey = GlobalKey<FormFieldState>();
  var passwordFormKey = GlobalKey<FormFieldState>();

  //FocusNode
  final userNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //for top picture
            RPadding(
              padding: const EdgeInsets.only(
                top: 77.25,
                left: 183.08,
                right: 182.91,
                bottom: 100.21,
              ),
              child: SizedBox(
                width: 47.84.w,
                height: 55.64.h,
                child: Image.asset("assets/gajar_image.jpg"),
              ),
            ),
            //Now for SIng UP text only
            RPadding(
              padding: const EdgeInsets.only(left: 25.01),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style: GoogleFonts.glory(
                            fontWeight: FontWeight.w600,
                            fontSize: 26.sp,
                            height: (29 / 26).h,
                            letterSpacing: 0,
                            color: Color(0xFF030303),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Text(
                          "Enter your credentials to continue",
                          style: GoogleFonts.glory(
                            color: Color(0xFF7C7C7C),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            height: (15 / 16).h,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Now for TextFormField
            RPadding(
              padding: const EdgeInsets.only(top: 40, left: 24.88),
              child: Form(
                key: formKey,
                child: SizedBox(
                  child: Column(
                    children: [
                      signUpTextFieldWidget(
                        forceErrorText:
                            ref
                                .watch(signUpValidationProvider)
                                .userNameErrorText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username  should not be null";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (p0) {
                          ref
                              .read(signUpValidationProvider)
                              .onChnagedUserNameValidation(
                                textControllerForUsername.text,
                              );
                        },
                        focusNode: userNameFocusNode,
                        textController: textControllerForUsername,
                        key: usernameFormKey,
                        labelText: "Username",
                      ),
                      SizedBox(height: 30.h),

                      //For Email
                      signUpTextFieldWidget(
                        forceErrorText:
                            ref.watch(signUpValidationProvider).emailErrorText,
                        onChanged: (p0) {
                          ref
                              .read(signUpValidationProvider)
                              .onChangedEmailValidation(
                                textControllerForEmail.text,
                              );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email Can not be null";
                          } else if (!(value.contains("@"))) {
                            return "Invalid Email Address.It should contain @";
                          } else {
                            return null;
                          }
                        },
                        focusNode: emailFocusNode,
                        textController: textControllerForEmail,
                        key: emailFormKey,
                        labelText: "Email",
                      ),
                      SizedBox(height: 30.h),

                      //For Password
                      signUpTextFieldWidget(
                        forceErrorText:
                            ref
                                .watch(signUpValidationProvider)
                                .passwordErrorText,
                        onChanged: (p0) {
                          ref
                              .read(signUpValidationProvider)
                              .onChangedPasswordValidation(
                                textControllerForPassword.text,
                              );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password should not be Empty";
                          } else {
                            return null;
                          }
                        },
                        focusNode: passwordFocusNode,
                        textController: textControllerForPassword,
                        key: passwordFormKey,
                        labelText: "Password",
                        isobscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RPadding(
              padding: const EdgeInsets.only(top: 20, left: 24.88),
              child: SizedBox(
                height: 42.h,
                width: 358.62.w,
                child: Column(
                  spacing: 0,
                  children: [
                    Row(
                      children: [
                        Text(
                          "By continuing you agree to our",
                          style: GoogleFonts.glory(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xFF030303),
                            letterSpacing: 0.05,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            " Terms of Service",
                            style: GoogleFonts.glory(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Color(0xFF53B175),
                              letterSpacing: 0.05,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "and",
                          style: GoogleFonts.glory(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xFF030303),
                            letterSpacing: 0.05,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            " Privacy Policy.",
                            style: GoogleFonts.glory(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Color(0xFF53B175),
                              letterSpacing: 0.05,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.003.h),
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  debugPrint("It is not validated Properly");
                }
              },
              child: bigButtonWidget(
                onTap: (){},
                height: 67.h,
                width: 364.w,
                color: Color(0xFF53B175),
                radius: 19.r,
                text: Text(
                  "Sign Up",
                  style: GoogleFonts.glory(
                    color: Color(0xFFFFF9FF),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    height: (18 / 18).h,
                  ),
                ),
              ),
            ),

            RPadding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 86.49,
                right: 86.31,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.glory(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Color(0xFF030303),
                    ),
                  ),
                  Text(
                    "Signup",
                    style: GoogleFonts.glory(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Color(0xFF53B175),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
