import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/beverages_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/explore_product_data_model.dart';


class BeveragesProvider extends ChangeNotifier {
  List<ExploreProductDataModel> beveragesDataProducts = [];

  void loadBeveragesProducts() {
    beveragesDataProducts =
        beveragesDataList
            .map((product) => ExploreProductDataModel.fromJson(product))
            .toList();
    notifyListeners();
  }
}

final beveragesProvider = ChangeNotifierProvider((ref) {
  return BeveragesProvider();
});
