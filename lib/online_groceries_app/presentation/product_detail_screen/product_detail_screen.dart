import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/home_screen/home_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  ImageProvider<Object> image;
  String productName;
  int index;
  ProductDetailScreen({
    required this.image,
    required this.productName,
    required this.index,
    super.key,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //This Container is for Mathiko Image
          Container(
            height: 371.44.h,
            width: 413.6.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.r),
                bottomLeft: Radius.circular(25.r),
              ),
              color: Color(0xFfF2F3F2),
            ),
            child: Column(
              children: [
                //This is for Icons,
                Row(
                  children: [
                    RPadding(
                      padding: const EdgeInsets.only(top: 56.93, left: 25.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Image(
                          image: AssetImage("assets/front_arrow.png"),
                          height: 18.h,
                          width: 10.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Spacer(),
                    RPadding(
                      padding: const EdgeInsets.only(top: 56.7, right: 25.3),
                      child: Image(
                        image: AssetImage("assets/up_arrow_logout.png"),
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: widget.productName,
                  child: Image(
                    image: widget.image,
                    height: 199.18,
                    width: 329.34,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
