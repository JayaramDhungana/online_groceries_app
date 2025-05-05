import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/Groceries/groceries_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/Groceries/groceries_data_model.dart';

class GroceriesProvider extends ChangeNotifier {
  List<GroceriesDataModel> groceriesProducts = [];
  void loadGroceriesProduct() {
    groceriesProducts =
        groceriesDataList
            .map((product) => GroceriesDataModel.fromJson(product))
            .toList();
    notifyListeners();
  }
}

final groceriesProvider = ChangeNotifierProvider((ref) {
  return GroceriesProvider();
});
