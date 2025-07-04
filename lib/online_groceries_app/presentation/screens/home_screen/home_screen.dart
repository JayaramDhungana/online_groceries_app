import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_List.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_model.dart';
import 'package:online_groceries_app/online_groceries_app/data/Groceries/groceries_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/best_selling/best_selling_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/explore_products_item/explore_product_item_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/product_detail_screen/product_detail_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/best_selling_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/cart_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/exclusive_offer_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/expore_item_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/favourite_Item_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/groceries_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/search_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/addToCardButton.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/card_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/groceries_type_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/products_title_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/search_text_form_field_widget.dart';

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
      ref.read(searchProvider).onQueryChanged("",context);
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

    final searchResultItemFromProvider = ref.watch(searchProvider).searchResult;
    bool isSearchResultAvailable =
        searchResultItemFromProvider.isEmpty ? false : true;
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
            searchTextFormFieldWidget(
              context: context,
              ref: ref,
              focusNode: searchFocusNode,
              padding: EdgeInsets.only(
                left: 24.71,
                right: 25.29,
                top: 20,
                bottom: 20,
              ),
            ),
            SizedBox(
              height: 114.99.h,
              width: 368.2.w,

              child: Image(
                image: AssetImage("assets/fresh_vegetable_full.png"),
              ),
            ),

            //This sized Box widget is only for Implement Search Funtionality
            //If we remove this sized box nothing is happened;
            isSearchResultAvailable
                ? SizedBox(
                  height: 500.h,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14.8.w,
                      mainAxisSpacing: 15.04.h,
                      mainAxisExtent: 248.51.h,
                    ),
                    itemCount: searchResultItemFromProvider.length,
                    itemBuilder: (context, index) {
                      debugPrint("The Coming index is $index");
                      final searchResultToShow =
                          searchResultItemFromProvider[index];
                      return cardWidget(
                        productImage: AssetImage(
                          searchResultToShow["imageUrl"],
                        ),
                        productName: searchResultToShow["productName"],
                        productPieces: searchResultToShow["productPieces"],
                        productPrice: searchResultToShow["productPrice"],
                        index: index,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailScreen(
                                  image: AssetImage(
                                    searchResultToShow["imageUrl"],
                                  ),
                                  productImageUrl:
                                      searchResultToShow["productName"],
                                  productName:
                                      searchResultToShow["productName"],
                                  index: index,
                                  productPrice:
                                      searchResultToShow["productPrice"],
                                  productPieces:
                                      searchResultToShow["productPieces"],
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
                : SizedBox(
                  child: Column(
                    children: [
                      productsTitleWidget(
                        productsTitle: "Exclusive Offer",
                        onTap: () {
                          ref
                              .read(exploreItemProvider)
                              .loadBeveragesProducts(
                                dataListFromUI: exclusiveOfferDataList,
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ExploreProductItemScreen(
                                    screenName: "Exclusive Offer",
                                  ),
                            ),
                          );
                        },
                      ),

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
                              padding: const EdgeInsets.only(
                                right: 15.18,
                                top: 20,
                              ),
                              child: cardWidget(
                                onTap: () {
                                  //using Go Router GO
                                  // try {
                                  //   debugPrint("errror is  started");
                                  //   context.go(
                                  //     "/Product_details_screen",
                                  //     extra: {
                                  //       'image': AssetImage(
                                  //         exclusiveOfferProductsToShow.imageUrl,
                                  //       ),
                                  //       'productImageUrl':
                                  //           exclusiveOfferProductsToShow.imageUrl,
                                  //       'productName':
                                  //           exclusiveOfferProductsToShow.productName,
                                  //       'index': index,
                                  //       'productPrice':
                                  //           exclusiveOfferProductsToShow.productPrice,
                                  //       'productPieces':
                                  //           exclusiveOfferProductsToShow.productPieces,
                                  //     },
                                  //   );
                                  //   debugPrint("errror is  ended");
                                  // } catch (e) {
                                  //   debugPrint("errror is  ${e.toString()}");
                                  // }

                                  //Using Navigator.push

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ProductDetailScreen(
                                            index: index,
                                            image: AssetImage(
                                              exclusiveOfferProductsToShow
                                                  .imageUrl,
                                            ),
                                            productImageUrl:
                                                exclusiveOfferProductsToShow
                                                    .imageUrl,
                                            productName:
                                                exclusiveOfferProductsToShow
                                                    .productName,
                                            productPrice:
                                                exclusiveOfferProductsToShow
                                                    .productPrice,
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
                                productName:
                                    exclusiveOfferProductsToShow.productName,
                                productPieces:
                                    exclusiveOfferProductsToShow.productPieces,
                                productPrice:
                                    exclusiveOfferProductsToShow.productPrice,
                              ),
                            );
                          },
                        ),
                      ),
                      productsTitleWidget(
                        productsTitle: "Best Selling",
                        onTap: () {
                          ref
                              .read(exploreItemProvider)
                              .loadBeveragesProducts(
                                dataListFromUI: bestSellingDataList,
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ExploreProductItemScreen(
                                    screenName: "Best Selling",
                                  ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 268.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: REdgeInsets.only(left: 24.71),
                          itemCount: bestSellingProductsFromProvider.length,
                          itemBuilder: (context, index) {
                            final bestSellingProductsToShow =
                                bestSellingProductsFromProvider[index];
                            return RPadding(
                              padding: const EdgeInsets.only(
                                right: 15.18,
                                top: 20,
                              ),
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
                                                bestSellingProductsToShow
                                                    .imageUrl,
                                            image: AssetImage(
                                              bestSellingProductsToShow
                                                  .imageUrl,
                                            ),

                                            productName:
                                                bestSellingProductsToShow
                                                    .productName,
                                            productPrice:
                                                bestSellingProductsToShow
                                                    .productPrice,
                                            productPieces:
                                                bestSellingProductsToShow
                                                    .productPieces,
                                          ),
                                    ),
                                  );
                                },
                                productImage: AssetImage(
                                  bestSellingProductsToShow.imageUrl,
                                ),
                                productName:
                                    bestSellingProductsToShow.productName,
                                productPieces:
                                    bestSellingProductsToShow.productPieces,
                                productPrice:
                                    bestSellingProductsToShow.productPrice,
                              ),
                            );
                          },
                        ),
                      ),
                      productsTitleWidget(
                        productsTitle: "Groceries",
                        onTap: () {
                          ref
                              .read(exploreItemProvider)
                              .loadBeveragesProducts(
                                dataListFromUI: groceriesDataList,
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ExploreProductItemScreen(
                                    screenName: "Groceries",
                                  ),
                            ),
                          );
                        },
                      ),
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
                                                groceriesProductsToShow
                                                    .imageUrl,
                                            index: index,
                                            image: AssetImage(
                                              groceriesProductsToShow.imageUrl,
                                            ),

                                            productName:
                                                groceriesProductsToShow
                                                    .productName,
                                            productPrice:
                                                groceriesProductsToShow
                                                    .productPrice,
                                            productPieces:
                                                groceriesProductsToShow
                                                    .productPieces,
                                          ),
                                    ),
                                  );
                                },
                                index: index,
                                productImage: AssetImage(
                                  groceriesProductsToShow.imageUrl,
                                ),
                                productName:
                                    groceriesProductsToShow.productName,
                                productPieces:
                                    groceriesProductsToShow.productPieces,
                                productPrice:
                                    groceriesProductsToShow.productPrice,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

            //This is for products Texts only
          ],
        ),
      ),
    );
  }
}
