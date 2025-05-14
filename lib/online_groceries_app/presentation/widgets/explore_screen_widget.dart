import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/bakery_and_snacks_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/beverages_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/cooking_oil_and_ghee_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/dairy_and_eggs_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/fresh_fruits_and_vegetable_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/meat_and_fish_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/explore_products_item/explore_product_item_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/expore_item_provider.dart';

Ink exploreScreenWidget({
  required Color color,
  required Color boarderColor,
  required ImageProvider<Object> image,
  required String text,
  required Color splashColor,
  required BuildContext context,
  required WidgetRef ref,
}) {
  return Ink(
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      splashColor: splashColor,
      onTap: () {
        if (text == "Fresh Fruits & Vegetable") {
          ref
              .read(exploreItemProvider)
              .loadBeveragesProducts(
                dataListFromUI: freshFruitsaAndVegatableList,
              );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreProductItemScreen(screenName: text),
            ),
          );
        } else if (text == "Cooking Oil & Ghee") {
          ref
              .read(exploreItemProvider)
              .loadBeveragesProducts(dataListFromUI: cookinOilAndGheeDataList);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreProductItemScreen(screenName: text),
            ),
          );
        } else if (text == "Meat & Fish") {
          ref
              .read(exploreItemProvider)
              .loadBeveragesProducts(dataListFromUI: meatAndFishDataList);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreProductItemScreen(screenName: text),
            ),
          );
        } else if (text == "Bakery &  Snacks") {
          ref
              .read(exploreItemProvider)
              .loadBeveragesProducts(dataListFromUI: bakeryAndSnacksDataList);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreProductItemScreen(screenName: text),
            ),
          );
        } else if (text == "Dairy & Eggs") {
          ref
              .read(exploreItemProvider)
              .loadBeveragesProducts(dataListFromUI: dairyAndEggsDataList);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreProductItemScreen(screenName: text),
            ),
          );
        } else if (text == "Beverages") {
          ref
              .read(exploreItemProvider)
              .loadBeveragesProducts(dataListFromUI: beveragesDataList);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreProductItemScreen(screenName: text),
            ),
          );
        }
      },
      // splashColor: Colors.red,
      child: Ink(
        height: 189.11.h,
        width: 174.5.w,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: boarderColor),
        ),
        child: Column(
          children: [
            RPadding(
              padding: const EdgeInsets.only(
                top: 27.68,
                left: 31.1,
                right: 32.02,
              ),
              child: Image(image: image, width: 111.38.w, height: 74.9.h),
            ),
            RPadding(
              padding: const EdgeInsets.only(
                top: 27.52,

                // left: 41.25,
                // right: 40.25,
                // bottom: 15,
              ),
              child: Center(
                child: Text(
                  text,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Gilory',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: (22 / 16).h,
                    letterSpacing: 0.1,
                    overflow: TextOverflow.ellipsis,
                    color: Color(0xFF181725),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
