import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/product_detail_screen/product_detail_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/expore_item_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/card_widget.dart';

class ExploreProductItemScreen extends ConsumerStatefulWidget {
  final String screenName;
  const ExploreProductItemScreen({required this.screenName, super.key});

  @override
  ConsumerState<ExploreProductItemScreen> createState() => _ExploreProductItemScreenState();
}

class _ExploreProductItemScreenState extends ConsumerState<ExploreProductItemScreen> {
  @override
  Widget build(BuildContext context) {
    final exploreItemsFromProvider =
        ref.watch(exploreItemProvider).exploreDataProducts;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.screenName,
          style: TextStyle(
            fontFamily: 'Gilory',
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            height: (20 / 18).h,
            letterSpacing: 0,
            color: Color(0xFF181725),
          ),
        ),
        actions: [
          RPadding(
            padding: const EdgeInsets.only(right: 24.99),
            child: Image(image: AssetImage("assets/beverage_icon.png")),
          ),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: RPadding(
              padding: const EdgeInsets.only(left: 25.01, right: 24.99),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 14.8.w,
                  mainAxisSpacing: 12.04.h,
                  crossAxisCount: 2,
                  mainAxisExtent: 248.51.h,
                ),
                itemCount: exploreItemsFromProvider.length,
                itemBuilder: (context, index) {
                  final beveragesProductsToShow =
                      exploreItemsFromProvider[index];
                  return cardWidget(
                    productImage: AssetImage(beveragesProductsToShow.imageUrl),
                    productName: beveragesProductsToShow.productName,
                    productPieces: beveragesProductsToShow.productPieces,
                    productPrice: beveragesProductsToShow.productPrice,
                    index: index,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ProductDetailScreen(
                                index: index,
                                image: AssetImage(
                                  beveragesProductsToShow.imageUrl,
                                ),
                                productImageUrl:
                                    beveragesProductsToShow.imageUrl,
                                productName:
                                    beveragesProductsToShow.productName,
                                productPrice:
                                    beveragesProductsToShow.productPrice,
                                productPieces:
                                    beveragesProductsToShow.productPieces,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
