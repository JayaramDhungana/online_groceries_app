import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/bottom_navigation_bar/Bottom_Navigation_Bar_Screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/cart_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/favourite_Item_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/big_button_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/bottom_nav_bar_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/favourite_items_widget.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favouriteItemProvider).loadFavouriteItemsFromSharedPreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favouriteProductsFromProvider =
        ref.watch(favouriteItemProvider).favouriteProducts;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 57.16.h,
        centerTitle: true,
        title: Text(
          "Favourite",
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
          Container(
            height: 1.h,
            width: 413.6.w,
            decoration: BoxDecoration(color: Color(0xFFE2E2E2)),
          ),
          Expanded(
            child:
                favouriteProductsFromProvider.isEmpty
                    ? Center(
                      child: Text(
                        "There is no Favourite Item",
                        style: TextStyle(fontFamily: 'Gilory', fontSize: 30),
                      ),
                    )
                    : ListView.builder(
                      itemCount: favouriteProductsFromProvider.length,
                      itemBuilder: (context, index) {
                        final favouriteProductsToShow =
                            favouriteProductsFromProvider[index];

                        return favouriteItemsWidget(
                          ref: ref,
                          context: context,
                          image: AssetImage(favouriteProductsToShow.imageUrl),
                          productName: favouriteProductsToShow.productName,
                          productPieces: favouriteProductsToShow.productPieces,
                          productPrice: favouriteProductsToShow.productPrice,
                        );
                      },
                    ),
          ),
          Spacer(),
          favouriteProductsFromProvider.isEmpty
              ? SizedBox()
              : RPadding(
                padding: const EdgeInsets.only(bottom: 24.45),
                child: bigButtonWidget(
                  width: 364.w,
                  height: 67.h,
                  color: Color(0xFF53B175),
                  radius: 19.r,
                  text: Text(
                    "Add all To Cart",
                    style: TextStyle(
                      fontFamily: 'Gilory',
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: (18 / 18).h,
                      letterSpacing: 0,
                      color: Color(0xFFFCFCFC),
                    ),
                  ),
                  onTap: () {
                    ref
                        .read(cartProvider)
                        .addFavouriteProductsIntoCart(
                          favouriteItemsFromUI: favouriteProductsFromProvider,
                        );
                    ref.read(bottomNavBarProvider).changeSelectedIndex(2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationBarScreen(),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }
}
