class CartDataModel {
  final String imageUrl;
  final String productName;
  final String productPieces;
  final int productCount;
  final double productPrice;
  final double initialProductPrice;

  CartDataModel({
    required this.imageUrl,
    required this.productName,
    required this.productPieces,
    required this.productCount,
    required this.productPrice,
    required this.initialProductPrice,
  });

  @override
  String toString() {
    return "imageUrl:$imageUrl,productName:$productName,productPieces:$productPieces,productCount:$productCount,productPrice:$productPrice,initialProductPrice:$initialProductPrice";
  }
}
