import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/favourite/favourite_data_model.dart';

class FavouriteItemProvider extends ChangeNotifier {
  List<FavouriteDataModel> favouriteProducts = [];

  void addFavouriteProduct({
    required FavouriteDataModel favouriteDataModelFromUI,
    required favouriteProductNameFromUI,
  }) {
    if (!(favouriteProducts.any(
      (item) => item.productName == favouriteProductNameFromUI,
    ))) {
      favouriteProducts.add(favouriteDataModelFromUI);
    } else {
      favouriteProducts.removeWhere(
        (item) => item.productName == favouriteProductNameFromUI,
      );
    }
    debugPrint(favouriteProducts.toString());
    notifyListeners();
  }
}

final favouriteItemProvider = ChangeNotifierProvider((ref) {
  return FavouriteItemProvider();
});
