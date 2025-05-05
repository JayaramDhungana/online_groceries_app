import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_items/explore_item_data_list.dart';
import 'package:online_groceries_app/online_groceries_app/data/explore_items/explore_item_data_model.dart';

class ExploreProvider extends ChangeNotifier {
  List<ExploreItemDataModel> exploreProducts = [];

  void loadExploreItems() {
    exploreProducts =
        exploreItemDataList
            .map((product) => ExploreItemDataModel.fromJson(product))
            .toList();
    notifyListeners();
  }
}

final exploreProvider = ChangeNotifierProvider((ref) {
  return ExploreProvider();
});
