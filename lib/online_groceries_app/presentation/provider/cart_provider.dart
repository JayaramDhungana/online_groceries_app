import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/best_selling/best_selling_data_model.dart';

class CartProvider extends ChangeNotifier {
  List<BestSellingDataModel> productInCart = [];

  void addProductToCart({
    required productImageFromUI,
    required productNamefromUI,
    required productPiecesFromUI,
    required productPriceFromUI,
  }) {
    productInCart.add(
      BestSellingDataModel(
        imageUrl: productImageFromUI.toString(),
        productName: productNamefromUI,
        productPieces: productPiecesFromUI,
        productPrice: productPriceFromUI,
      ),
    );
    debugPrint(productInCart.toString());
    notifyListeners();
  }
}

final cartProvider = ChangeNotifierProvider((ref) {
  return CartProvider();
});
