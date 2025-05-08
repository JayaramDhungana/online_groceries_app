import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/beverages/beverages_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/beverages/beverages_data_model.dart';

class BeveragesProvider extends ChangeNotifier {
  List<BeveragesDataModel> beveragesDataProducts = [];

  void loadBeveragesProducts() {
    beveragesDataProducts =
        beveragesDataList
            .map((product) => BeveragesDataModel.fromJson(product))
            .toList();
    notifyListeners();
  }
}

final beveragesProvider = ChangeNotifierProvider((ref) {
  return BeveragesProvider();
});
