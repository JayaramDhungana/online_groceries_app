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

  factory FavouriteDataModel.fromJson(Map<String, dynamic> json) {
    return FavouriteDataModel(
      imageUrl: json["imageUrl"],
      productName: json["productName"],
      productPieces: json["productPieces"],
      productPrice: json["productPrice"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'productName': productName,
      'productPieces': productPieces,
      'productPrice': productPrice,
    };
  }

  @override
  String toString() {
    return "imageUrl:$imageUrl,productName:$productName,productPieces:$productPieces,productPrice:$productPrice";
  }
}
