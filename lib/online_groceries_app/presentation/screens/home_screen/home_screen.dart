import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_List.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_model.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/product_detail_screen/product_detail_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/best_selling_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/cart_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/exclusive_offer_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/favourite_Item_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/groceries_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/addToCardButton.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/card_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/groceries_type_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/products_title_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var searchFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(exclusiveOfferProvider).loadExclusiveOfferData();
      ref.read(bestSellingProvider).loadBestSellingProducts();
      ref.read(groceriesProvider).loadGroceriesProduct();
      ref.read(favouriteItemProvider).loadFavouriteItemsFromSharedPreferences();
      ref.read(cartProvider).loadItemsFromSharedPreferences();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exclusiveOfferProductsFromProvider =
        ref.watch(exclusiveOfferProvider).exclusiveOfferProducts;
    final bestSellingProductsFromProvider =
        ref.watch(bestSellingProvider).bestSellingProduct;
    final groceriesProductsFromProvider =
        ref.watch(groceriesProvider).groceriesProducts;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 98.26.h, width: 414.w),
                Positioned(
                  bottom: 0,
                  right: (MediaQuery.of(context).size.width) / 2,
                  child: SizedBox(
                    height: 30,
                    width: 30,

                    child: Image(image: AssetImage("assets/gajar_image.jpg")),
                  ),
                ),
              ],
            ),
            RPadding(
              padding: const EdgeInsets.only(left: 125.42, right: 126.01),
              child: SizedBox(
                height: 22.69.h,
                width: 162.57.w,
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/location_image.png")),
                    SizedBox(width: 4.53.w),
                    Text(
                      "Dhaka,Banassre",
                      style: TextStyle(
                        fontFamily: 'Gilory',
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Color(0xFF4C4F4D),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RPadding(
              padding: EdgeInsets.only(
                left: 24.71,
                right: 25.29,
                top: 20,
                bottom: 20,
              ),
              child: TextFormField(
                focusNode: searchFocusNode,
                onTapOutside: (event) {
                  searchFocusNode.unfocus();
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
            ),
            SizedBox(
              height: 114.99.h,
              width: 368.2.w,

              child: Image(
                image: AssetImage("assets/fresh_vegetable_full.png"),
              ),
            ),

            //This is for products Texts only
            productsTitleWidget(productsTitle: "Exclusive Offer"),

            //This is for Card of Showing Products.
            SizedBox(
              height: 268.h,
              child: ListView.builder(
                padding: REdgeInsets.only(left: 24.71),
                scrollDirection: Axis.horizontal,
                itemCount: exclusiveOfferProductsFromProvider.length,
                itemBuilder: (context, index) {
                  final exclusiveOfferProductsToShow =
                      exclusiveOfferProductsFromProvider[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.18, top: 20),
                    child: cardWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetailScreen(
                                  index: index,
                                  image: AssetImage(
                                    exclusiveOfferProductsToShow.imageUrl,
                                  ),
                                  productImageUrl:
                                      exclusiveOfferProductsToShow.imageUrl,
                                  productName:
                                      exclusiveOfferProductsToShow.productName,
                                  productPrice:
                                      exclusiveOfferProductsToShow.productPrice,
                                  productPieces:
                                      exclusiveOfferProductsToShow
                                          .productPieces,
                                ),
                          ),
                        );
                      },
                      index: index,
                      context: context,
                      productImage: AssetImage(
                        exclusiveOfferProductsToShow.imageUrl,
                      ),
                      productName: exclusiveOfferProductsToShow.productName,
                      productPieces: exclusiveOfferProductsToShow.productPieces,
                      productPrice: exclusiveOfferProductsToShow.productPrice,
                    ),
                  );
                },
              ),
            ),
            productsTitleWidget(productsTitle: "Best Selling"),
            SizedBox(
              height: 268.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: REdgeInsets.only(left: 24.71),
                itemCount: bestSellingProductsFromProvider.length,
                itemBuilder: (context, index) {
                  final BestSellingProductsToShow =
                      bestSellingProductsFromProvider[index];
                  return RPadding(
                    padding: const EdgeInsets.only(right: 15.18, top: 20),
                    child: cardWidget(
                      index: index,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetailScreen(
                                  index: index,
                                  productImageUrl:
                                      BestSellingProductsToShow.imageUrl,
                                  image: AssetImage(
                                    BestSellingProductsToShow.imageUrl,
                                  ),

                                  productName:
                                      BestSellingProductsToShow.productName,
                                  productPrice:
                                      BestSellingProductsToShow.productPrice,
                                  productPieces:
                                      BestSellingProductsToShow.productPieces,
                                ),
                          ),
                        );
                      },
                      productImage: AssetImage(
                        BestSellingProductsToShow.imageUrl,
                      ),
                      productName: BestSellingProductsToShow.productName,
                      productPieces: BestSellingProductsToShow.productPieces,
                      productPrice: BestSellingProductsToShow.productPrice,
                    ),
                  );
                },
              ),
            ),
            productsTitleWidget(productsTitle: "Groceries"),
            Padding(
              padding: const EdgeInsets.only(left: 24.71),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    groceriesTypeWidget(
                      color: Color(0xFFFEF1E4),
                      image: AssetImage("assets/pulses_Image.png"),
                      text: "Pulses",
                    ),
                    SizedBox(width: 14.95),
                    groceriesTypeWidget(
                      color: Color(0xFFE5F3EA),
                      image: AssetImage("assets/rice_image.png"),
                      text: "Rice",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 268.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: groceriesProductsFromProvider.length,
                itemBuilder: (context, index) {
                  final groceriesProductsToShow =
                      groceriesProductsFromProvider[index];
                  return RPadding(
                    padding: const EdgeInsets.only(left: 24.71),
                    child: cardWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetailScreen(
                                  productImageUrl:
                                      groceriesProductsToShow.imageUrl,
                                  index: index,
                                  image: AssetImage(
                                    groceriesProductsToShow.imageUrl,
                                  ),

                                  productName:
                                      groceriesProductsToShow.productName,
                                  productPrice:
                                      groceriesProductsToShow.productPrice,
                                  productPieces:
                                      groceriesProductsToShow.productPieces,
                                ),
                          ),
                        );
                      },
                      index: index,
                      productImage: AssetImage(
                        groceriesProductsToShow.imageUrl,
                      ),
                      productName: groceriesProductsToShow.productName,
                      productPieces: groceriesProductsToShow.productPieces,
                      productPrice: groceriesProductsToShow.productPrice,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
