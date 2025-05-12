import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/SharedPreferences/sharedPreferences_data.dart';
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

    SharedpreferencesData.addFavouriteItemsInSharedPreferences(
      favouriteProducts,
    );
    notifyListeners();
  }

  //Load Favourites Items From Shared preferences
  Future<void> loadFavouriteItemsFromSharedPreferences() async {
    List<String> favouriteItemsFromSharedPreferences =
        await SharedpreferencesData.extractFavouriteItemsFromSharedPreferences();

    favouriteProducts =
        favouriteItemsFromSharedPreferences
            .map((item) => FavouriteDataModel.fromJson(jsonDecode(item)))
            .toList();
    notifyListeners();
  }


}

final favouriteItemProvider = ChangeNotifierProvider((ref) {
  return FavouriteItemProvider();
});
