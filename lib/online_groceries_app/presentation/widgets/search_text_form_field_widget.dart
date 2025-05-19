import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/search_provider.dart';

RPadding searchTextFormFieldWidget({
  required FocusNode focusNode,
  required WidgetRef ref,
  required EdgeInsets padding,
  required BuildContext context
}) {
  return RPadding(
    padding: padding,
    // EdgeInsets.only(left: 24.71, right: 25.29, top: 20, bottom: 20),
    child: TextFormField(
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      //Search Functionality ko lagi
      onChanged: (value) {
        ref.read(searchProvider).onQueryChanged(value,context);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        // prefix: Image(image: AssetImage("assets/search_icon.png")),
        hintText: "Search Store",
        hintStyle: TextStyle(
          fontFamily: 'Gilory',
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Color(0xFF7C7C7C),
        ),
        filled: true,
        fillColor: Color(0xFFF2F3F2),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
