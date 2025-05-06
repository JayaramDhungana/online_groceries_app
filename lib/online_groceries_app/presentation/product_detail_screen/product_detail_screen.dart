import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/bottom_navigation_bar/Bottom_Navigation_Bar_Screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/cart/cart_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/cart_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/product_detail_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/screens/home_screen/home_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  ImageProvider<Object> image;
  String productImageUrl;
  String productName;
  String productPrice;
  String productPieces;
  int index;
  ProductDetailScreen({
    required this.image,
    required this.productImageUrl,
    required this.productName,
    required this.index,
    required this.productPrice,
    required this.productPieces,

    super.key,
  });

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
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
                              builder: (context) => BottomNavigationBarScreen(),
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
                //This is for image showing
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
          //This is for Product Name
          RPadding(
            padding: const EdgeInsets.only(top: 30.5, left: 25.01, right: 25),
            child: Row(
              children: [
                Text(
                  widget.productName,
                  style: TextStyle(
                    fontFamily: 'Gilory',
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    height: (24 / 18).h,
                    letterSpacing: 0.1,
                  ),
                ),
                Spacer(),
                Icon(Icons.favorite_outline),
              ],
            ),
          ),
          //This is For Product Price
          RPadding(
            padding: const EdgeInsets.only(left: 25.01, top: 10.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text("${widget.productPieces} ,Price")],
            ),
          ),
          //This is for add or minus button and price
          RPadding(
            padding: const EdgeInsets.only(left: 25.01, top: 30.14),
            child: Row(
              children: [
                SizedBox(
                  width: 119.67,
                  height: 45.67,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //This is Minus Button
                      InkWell(
                        borderRadius: BorderRadius.circular(50.r),
                        onTap: () {
                          ref
                              .read(productDetailProvider)
                              .decreaseProductCount();
                        },
                        child: Ink(
                          height: 45.h,
                          width: 17.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),

                          child: Center(
                            child: Ink(
                              height: 2.84.h,
                              width: 17.w,
                              color: Color(0xFFB3B3B3),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 45.67.w,
                        height: 45.67.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE2E2E2)),
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                        //This is for Showing count
                        child: Center(
                          child: Text(
                            ref
                                .watch(productDetailProvider)
                                .productCount
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'Gilory',
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              height: (18 / 18).h,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),

                      //This is for Plus Button
                      InkWell(
                        borderRadius: BorderRadius.circular(50.r),
                        onTap: () {
                          ref
                              .read(productDetailProvider)
                              .increaseProductCount();
                        },
                        child: Ink(
                          height: 45.h,
                          width: 17.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),

                          child: Center(
                            child: Image(
                              image: AssetImage("assets/plus_icon.png"),
                              // height: 17.h,
                              // width: 17.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                RPadding(
                  padding: const EdgeInsets.only(right: 25.1),
                  child: Text(
                    "\$${widget.productPrice}",
                    style: TextStyle(
                      fontFamily: 'Gilory',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      height: (24 / 18).h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.4),
          dividerWidget(),

          RPadding(
            padding: const EdgeInsets.only(top: 18.05, left: 30.01, right: 25),
            child: Container(
              width: 358.99,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Product Detail",
                        style: TextStyle(
                          fontFamily: 'Gilory',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          height: (16 / 18).h,
                          letterSpacing: 0,
                        ),
                      ),
                      Spacer(),
                      Image(
                        image: AssetImage("assets/bottomArrow.png"),
                        height: 14.h,
                        width: 8.4.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 91.55.h),
          dividerWidget(),
          RPadding(
            padding: const EdgeInsets.only(top: 20.05, left: 30.01),
            child: Row(
              children: [
                SizedBox(
                  height: 18.h,
                  width: 108.5.w,
                  child: Text(
                    "Nutritions",
                    style: TextStyle(
                      fontFamily: 'Gilory',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      height: (16 / 18).h,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                RPadding(
                  padding: const EdgeInsets.only(left: 187.87),
                  child: Container(
                    height: 18.h,
                    width: 33.61.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(
                      child: Text(
                        "100gr",
                        style: TextStyle(
                          fontFamily: 'Gilory',
                          fontWeight: FontWeight.w600,
                          fontSize: 9.sp,
                          height: (9 / 13.5).h,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                RPadding(
                  padding: const EdgeInsets.only(left: 20.6, right: 25),
                  child: Image(image: AssetImage("assets/back arrow.png")),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.95),
          dividerWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 18.05, left: 30.01),
            child: Row(
              children: [
                SizedBox(
                  height: 18.h,
                  width: 108.5.w,
                  child: Text(
                    "Review",
                    style: TextStyle(
                      fontFamily: 'Gilory',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      height: (16 / 18).h,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                Spacer(),
                Image(image: AssetImage("assets/star_image.png")),
                Image(image: AssetImage("assets/star_image.png")),
                Image(image: AssetImage("assets/star_image.png")),
                Image(image: AssetImage("assets/star_image.png")),
                Image(image: AssetImage("assets/star_image.png")),

                RPadding(
                  padding: const EdgeInsets.only(left: 20, right: 25.24),
                  child: Image(image: AssetImage("assets/back arrow.png")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.14),
            child: bigButtonWidget(
              onTap: () {
                ref
                    .read(cartProvider)
                    .addProductToCart(
                      productImageFromUI: widget.productImageUrl,
                      productNamefromUI: widget.productName,
                      productPiecesFromUI: widget.productPieces,
                      productPriceFromUI: widget.productPrice,
                    );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              width: 364.w,
              height: 67.h,
              color: Color(0xFF53B175),
              radius: 19,
              text: Text(
                "Add To Basket",
                style: TextStyle(
                  fontFamily: 'Gilory',
                  color: Color(0xFFFFF9FF),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: (18 / 18).h,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center dividerWidget() {
    return Center(
      child: Container(height: 1, width: 363.99.w, color: Color(0xFFE2E2E2)),
    );
  }
}
