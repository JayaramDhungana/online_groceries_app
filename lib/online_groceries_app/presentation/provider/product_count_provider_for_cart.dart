import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCountProviderForCart extends ChangeNotifier {
  int productCount = 1;
  List<Map<String, dynamic>> productCountList = [];

  void addProductCountList({
    required nameFromUI,
    required countFromUI,
    required priceFromUI,
  }) {
    productCountList.add({
      "name": nameFromUI,
      "count": countFromUI,
      "price": priceFromUI,
    });
  }

  void increaseProductCount({nameFromUI}) {
    debugPrint("increase button is Pressed");
    productCountList.contains(nameFromUI);
  }

  void decreaseProductCount() {
    debugPrint("Decrease button is Pressed");
    if (productCount > 1) {
      productCount = productCount - 1;
    }

    notifyListeners();
  }
}

final productCountProviderForCart = ChangeNotifierProvider((ref) {
  return ProductCountProviderForCart();
});
