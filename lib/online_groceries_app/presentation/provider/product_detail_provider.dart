import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailProvider extends ChangeNotifier {
  int productCount = 1;
  void increaseProductCount() {
    debugPrint("increase button is Pressed");
    productCount = productCount + 1;
    notifyListeners();
  }

  void decreaseProductCount() {
    debugPrint("Decrease button is Pressed");
    if (productCount > 1) {
      productCount = productCount - 1;
    }

    notifyListeners();
  }

  void resetProductCount() {
    productCount = 1;
    notifyListeners();
  }
}

final productDetailProvider = ChangeNotifierProvider((ref) {
  return ProductDetailProvider();
});
