import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_List.dart';
import 'package:online_groceries_app/online_groceries_app/data/best_selling/best_selling_data_list.dart';

class SearchProvider extends ChangeNotifier {
  String query = "";

  // List<Map<String, dynamic>> allItemsList = bestSellingDataList.add(
  //   exclusiveOfferDataList,
  // );

  void onQueryChanged(String queryFromUI) {
    query = queryFromUI;
    notifyListeners();
  }
}

final searchProvider = ChangeNotifierProvider((ref) {
  return SearchProvider();
});
