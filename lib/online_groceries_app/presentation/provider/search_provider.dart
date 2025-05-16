import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_List.dart';
import 'package:online_groceries_app/online_groceries_app/data/best_selling/best_selling_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_items/explore_item_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/bakery_and_snacks_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/beverages_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/cooking_oil_and_ghee_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/dairy_and_eggs_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/fresh_fruits_and_vegetable_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/meat_and_fish_data_list.dart';

class SearchProvider extends ChangeNotifier {
  String query = "";

  List<Map<String, dynamic>> allItemsList = [];
  List<String> productNameInAllItemList = [];

  List<Map<String, dynamic>> searchResult = [];

  void addAllItems() {
    addAllItemsFunction(dataList: bestSellingDataList);
    addAllItemsFunction(dataList: exclusiveOfferDataList);
    addAllItemsFunction(dataList: bakeryAndSnacksDataList);
    addAllItemsFunction(dataList: beveragesDataList);
    addAllItemsFunction(dataList: cookinOilAndGheeDataList);
    addAllItemsFunction(dataList: dairyAndEggsDataList);
    addAllItemsFunction(dataList: freshFruitsaAndVegatableList);
    addAllItemsFunction(dataList: meatAndFishDataList);
  }

  void addAllItemsFunction({required List<Map<String, dynamic>> dataList}) {
    for (int i = 0; i < dataList.length; i++) {
      if (!(allItemsList.any(
        (item) => item["productName"] == dataList[i]["productName"],
      ))) {
        allItemsList.add(dataList[i]);
      } else {
        debugPrint("One data is not added");
      }
    }

    // allItemsList.addAll(bestSellingDataList);
    // allItemsList.addAll(exclusiveOfferDataList);
    // allItemsList.addAll(bakeryAndSnacksDataList);
    // allItemsList.addAll(beveragesDataList);
    // allItemsList.addAll(cookinOilAndGheeDataList);
    // allItemsList.addAll(dairyAndEggsDataList);
    // allItemsList.addAll(freshFruitsaAndVegatableList);
    // allItemsList.addAll(meatAndFishDataList);
    notifyListeners();
  }

  void onQueryChanged(String queryFromUI) {
    searchResult.removeRange(0, searchResult.length);
    debugPrint(" Query from UI $queryFromUI");

    //Main logic for search the items
    if (!(queryFromUI == "")) {
      for (int i = 0; i < allItemsList.length; i++) {
        final eachItemsInMap = allItemsList[i];
        if (
        // queryFromUI.toLowerCase() ==
        eachItemsInMap["productName"].toString().toLowerCase().contains(
          queryFromUI.toLowerCase(),
        )) {
          debugPrint("Product is successfully found");
          searchResult.add(eachItemsInMap);
          debugPrint("Searched Product is $searchResult");
        } else {
          debugPrint("Product is not found");
          // searchResult.removeRange(0, searchResult.length);
        }
      }
    }

    notifyListeners();
  }
}

final searchProvider = ChangeNotifierProvider((ref) {
  return SearchProvider();
});
