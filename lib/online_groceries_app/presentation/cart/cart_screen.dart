import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/order_accpted/order_accepted_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/cart_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/product_detail_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/bottomSheetWidget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/cart_showing_widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productDetailProvider).resetProductCount();
      ref.read(cartProvider).loadItemsFromSharedPreferences();
      // ref.read(cartProvider).calculateTotalMoney();
    });
  }

  double totalMoney = 0;

  // double calculateTotalMoney(final cartItemsFromProvider) {
  //   for (int i = 0; i < cartItemsFromProvider.length; i++) {
  //     double moneyOfOneItem = cartItemsFromProvider[i].productPrice;
  //     totalMoney = totalMoney + moneyOfOneItem;
  //     debugPrint("The total money is :$totalMoney");
  //   }
  //   return totalMoney;
  // }

  @override
  Widget build(BuildContext context) {
    final cartItemsFromProvider = ref.watch(cartProvider).productInCart;
    // calculateTotalMoney(cartItemsFromProvider);
    totalMoney = 0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 57.16,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
            fontFamily: 'Gilory',
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            height: (20 / 18).h,
            letterSpacing: 0,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(height: 1.h, width: 413.6.w, color: Color(0xFFE2E2E2)),

          Expanded(
            child:
                cartItemsFromProvider.isEmpty
                    ? Center(
                      child: Text(
                        " Your Cart is Empty",
                        style: TextStyle(fontFamily: 'Gilory', fontSize: 40),
                      ),
                    )
                    : ListView.builder(
                      itemCount: cartItemsFromProvider.length,

                      itemBuilder: (context, index) {
                        final cartItemsToShow = cartItemsFromProvider[index];

                        totalMoney = totalMoney + cartItemsToShow.productPrice;
                        return cartShowingWidget(
                          productName: cartItemsToShow.productName,
                          productImage: AssetImage(cartItemsToShow.imageUrl),
                          productPrice: cartItemsToShow.productPrice.toString(),
                          productPieces: cartItemsToShow.productPieces,
                          productIndex: index,
                          productCount: cartItemsToShow.productCount,
                          ref: ref,
                        );
                      },
                    ),
          ),
          cartItemsFromProvider.isEmpty
              ? SizedBox()
              : RPadding(
                padding: const EdgeInsets.only(bottom: 24.45),
                child: bigButtonWidget(
                  color: Color(0xFF53B175),
                  height: 67.h,
                  width: 364.w,
                  radius: 19.r,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Color(0xFFF2F3F2),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 0.52),
                          child: Container(
                            height: 531.h,
                            width: 414.w,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    RPadding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                        left: 25.01,
                                        bottom: 30,
                                      ),
                                      child: SizedBox(
                                        height: 29.h,
                                        width: 107.w,
                                        child: Text(
                                          "Checkout ",
                                          style: TextStyle(
                                            fontFamily: 'Gilory',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24.sp,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    RPadding(
                                      padding: const EdgeInsets.only(
                                        top: 36.73,
                                        right: 25,
                                        bottom: 36.73,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image(
                                          image: AssetImage(
                                            "assets/close_icon.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 413.99.w,
                                  height: 1,
                                  color: Color(0xFFE2E2E2),
                                ),
                                bottomSheetWidget(
                                  titleText: "Delivery",
                                  subTittle: "Select Method",
                                ),
                                bottomSheetWidget(
                                  titleText: "Payment",
                                  subTittle: "",
                                ),
                                bottomSheetWidget(
                                  titleText: "Promo Code",
                                  subTittle: "Pick discount",
                                ),

                                bottomSheetWidget(
                                  titleText: "Total Cost",
                                  subTittle: totalMoney.toString(),
                                ),
                                RPadding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 25.01,
                                    right: 30,
                                  ),
                                  child: SizedBox(
                                    height: 42.h,
                                    width: 358.99.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "By placing an order you agree to our",
                                              style: TextStyle(
                                                fontFamily: 'Gilory',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                height: (21 / 14).h,
                                                letterSpacing: 0,
                                                color: Color(0xFF7C7C7C),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Terms ",
                                              style: TextStyle(
                                                fontFamily: 'Gilory',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                height: (21 / 14).h,
                                                letterSpacing: 0,
                                                color: Color(0xFF181725),
                                              ),
                                            ),
                                            Text(
                                              "And",
                                              style: TextStyle(
                                                fontFamily: 'Gilory',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                height: (21 / 14).h,
                                                letterSpacing: 0,
                                                color: Color(0xFF7C7C7C),
                                              ),
                                            ),
                                            Text(
                                              " Conditions",
                                              style: TextStyle(
                                                fontFamily: 'Gilory',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                height: (21 / 14).h,
                                                letterSpacing: 0,
                                                color: Color(0xFF181725),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 26.5,
                                    left: 24.74,
                                    right: 25.26,
                                  ),
                                  child: bigButtonWidget(
                                    width: 364.w,
                                    height: 67.h,
                                    color: Color(0xFF53B175),
                                    radius: 19.r,
                                    text: Text(
                                      "Place Order",
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  OrderAcceptedScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  text: Text(
                    "Go to Checkout",
                    style: TextStyle(
                      fontFamily: 'Gilory',
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: (18 / 18).h,
                      letterSpacing: 0,
                      color: Color(0xFFFCFCFC),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
