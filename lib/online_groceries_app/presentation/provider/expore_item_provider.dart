import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/beverages_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_products/explore_product_data_model.dart';


class ExporeItemProvider extends ChangeNotifier {
  List<ExploreProductDataModel> exploreDataProducts = [];

  void loadBeveragesProducts({required List<Map<String, dynamic>> dataListFromUI}) {
    exploreDataProducts =
        dataListFromUI
            .map((product) => ExploreProductDataModel.fromJson(product))
            .toList();
    notifyListeners();
  }
}

final exploreItemProvider = ChangeNotifierProvider((ref) {
  return ExporeItemProvider();
});
