import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_groceries_app/online_groceries_app/data/Cart/cart_data_model.dart';
import 'package:online_groceries_app/online_groceries_app/data/best_selling/best_selling_data_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartDataModel> productInCart = [];

  void addProductToCart({
    required productNamefromUI,
    required CartDataModel cartDataModelFromUI,
  }) {
    if (!(productInCart.any((item) => item.productName == productNamefromUI))) {
      productInCart.add(cartDataModelFromUI);
    } else {
      debugPrint("Product already exist in the cart");
    }

    debugPrint(productInCart.toString());
    notifyListeners();
    debugPrint("productInCart ${productInCart.toString()}");
  }

  //To Increase Count and Money
  void increaseCount({required int indexFromUI}) {
    debugPrint("Product Count's Plus Button is pressed");

    int productCountForUpdate = productInCart[indexFromUI].productCount;
    double productPriceForUpdate =
        productInCart[indexFromUI].initialProductPrice;

    productInCart[indexFromUI] = CartDataModel(
      imageUrl: productInCart[indexFromUI].imageUrl,
      productName: productInCart[indexFromUI].productName,
      productPieces: productInCart[indexFromUI].productPieces,
      productCount: productCountForUpdate + 1,
      initialProductPrice: productInCart[indexFromUI].initialProductPrice,
      productPrice: productPriceForUpdate * (productCountForUpdate + 1),
    );
    debugPrint(" after button tapped $productInCart.toList.toString()");
    notifyListeners();
  }

  //To decrease Count and Money
  void decreaseCount({required int indexFromUI}) {
    debugPrint("Product Count's Plus Button is pressed");

    int productCountFordecrease = productInCart[indexFromUI].productCount;
    double productPriceForUpdate =
        productInCart[indexFromUI].initialProductPrice;
    if (productCountFordecrease > 1) {
      productInCart[indexFromUI] = CartDataModel(
        imageUrl: productInCart[indexFromUI].imageUrl,
        productName: productInCart[indexFromUI].productName,
        productPieces: productInCart[indexFromUI].productPieces,
        productCount: productCountFordecrease - 1,
        initialProductPrice: productInCart[indexFromUI].initialProductPrice,
        productPrice: productPriceForUpdate * (productCountFordecrease - 1),
      );
    } else {
      debugPrint("Product Count Can not be decrease");
    }

    debugPrint(" after button tapped $productInCart.toList.toString()");
    notifyListeners();
  }

  //This function is for remove product from cart
  void removeProductFromCount(indexFromUi) {
    productInCart.removeAt(indexFromUi);
    notifyListeners();
  }
}

final cartProvider = ChangeNotifierProvider((ref) {
  return CartProvider();
});
