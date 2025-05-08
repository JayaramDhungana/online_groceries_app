class FavouriteDataModel {
  final String imageUrl;
  final String productName;
  final String productPieces;
  final double productPrice;

  FavouriteDataModel({
    required this.imageUrl,
    required this.productName,
    required this.productPieces,
    required this.productPrice,
  });

  @override
  String toString() {
    return "imageUrl:$imageUrl,productName:$productName,productPieces:$productPieces,productPrice:$productPrice";
  }
}
