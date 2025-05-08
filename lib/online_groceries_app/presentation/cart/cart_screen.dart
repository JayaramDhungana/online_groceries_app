import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/cart_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/product_detail_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartItemsFromProvider = ref.watch(cartProvider).productInCart;

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
                  onTap: () {},
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
