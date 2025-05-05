import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/best_selling/best_selling_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/best_selling/best_selling_data_model.dart';

class BestSellingProvider extends ChangeNotifier {
  List<BestSellingDataModel> bestSellingProduct = [];

  void loadBestSellingProducts() {
    bestSellingProduct =
        bestSellingDataList
            .map((product) => BestSellingDataModel.fromJson(product))
            .toList();
    notifyListeners();
  }
}

final bestSellingProvider = ChangeNotifierProvider((ref) {
  return BestSellingProvider();
});
