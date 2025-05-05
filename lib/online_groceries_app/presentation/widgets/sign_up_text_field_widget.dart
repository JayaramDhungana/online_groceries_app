import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox signUpTextFieldWidget({
  required TextEditingController textController,
  required GlobalKey key,
  required String labelText,
  required FocusNode focusNode,
  required String? Function(String?)? validator,
  required void Function(String)? onChanged,
  required String forceErrorText,

  bool isobscureText = false,
}) {
  return SizedBox(
    // height: 78.55.h,
    // width: 364.12.w,
    child: Column(
      children: [
        TextFormField(
          onChanged: onChanged,
          forceErrorText: forceErrorText.isEmpty ? null : forceErrorText,
          validator: validator,
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          focusNode: focusNode,
          controller: textController,
          key: key,
          obscureText: isobscureText,

          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),

            label: Text(
              labelText,
              style: GoogleFonts.glory(
                color: Color(0xFF7C7C7C),
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                height: (29 / 16).h,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
