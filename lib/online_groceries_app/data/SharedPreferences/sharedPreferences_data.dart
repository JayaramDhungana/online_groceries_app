import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:online_groceries_app/online_groceries_app/data/Cart/cart_data_model.dart';
import 'package:online_groceries_app/online_groceries_app/data/favourite/favourite_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferencesData {
  static String keyForCartItem = "cart_items_in_shared_preferences";
  static String keyForFavouriteItem = "favourite_items_in_shared_preferences";

  //To Store Cart Item to the Shared Preferences
  static Future<void> addCartItemInSharedPreferences(
    List<CartDataModel> cartItems,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartItemsToStore =
        cartItems.map((items) => jsonEncode(items.toJson())).toList();

    debugPrint("cart Items in Shared Preferences :$cartItemsToStore");
    prefs.setStringList(keyForCartItem, cartItemsToStore);
  }

  // To Extract Data From Shared Preferences
  static Future<List<String>> extractItemsFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> itemsFromSharedPreferences =
        prefs.getStringList(keyForCartItem) ?? [];

    return itemsFromSharedPreferences;
  }

  // To Store Favourite Items to the Shared Preferences
  static Future<void> addFavouriteItemsInSharedPreferences(
    List<FavouriteDataModel> favouriteItems,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favouriteItemToStore =
        favouriteItems.map((items) => jsonEncode(items.toJson())).toList();

    prefs.setStringList(keyForFavouriteItem, favouriteItemToStore);
    debugPrint("Favourite Items in Shared Preferences:$favouriteItemToStore");
  }

  //To Extract Favourite Items From SharedPreferences
  static Future<List<String>>
  extractFavouriteItemsFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favouriteItemsFromSharedPreferences =
        prefs.getStringList(keyForFavouriteItem) ?? [];
    debugPrint(
      " Favourite Data is Successfully Extracted $favouriteItemsFromSharedPreferences",
    );
    return favouriteItemsFromSharedPreferences;
  }
}
