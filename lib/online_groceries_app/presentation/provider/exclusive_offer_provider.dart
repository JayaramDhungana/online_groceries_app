import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_List.dart';
import 'package:online_groceries_app/online_groceries_app/data/ExclusiveOffer/exclusive_offer_data_model.dart';

class ExclusiveOfferProvider extends ChangeNotifier {
  List<ExclusiveOfferDataModel> exclusiveOfferProducts = [];

  loadExclusiveOfferData() {
    exclusiveOfferProducts =
        exclusiveOfferDataList
            .map((products) => ExclusiveOfferDataModel.fromJson(products))
            .toList();
    debugPrint(
      "The prducts in Provider is ${exclusiveOfferProducts.toString()}",
    );
    notifyListeners();
  }
}

final exclusiveOfferProvider = ChangeNotifierProvider((ref) {
  return ExclusiveOfferProvider();
});
