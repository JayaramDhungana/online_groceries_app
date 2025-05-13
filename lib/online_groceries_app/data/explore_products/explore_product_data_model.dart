class ExploreProductDataModel {
  final String imageUrl;
  final String productName;
  final String productPieces;
  final String productPrice;

  ExploreProductDataModel({
    required this.imageUrl,
    required this.productName,
    required this.productPieces,
    required this.productPrice,
  });

  factory ExploreProductDataModel.fromJson(Map<String, dynamic> json) {
    return ExploreProductDataModel(
      imageUrl: json["imageUrl"],
      productName: json["productName"],
      productPieces: json["productPieces"],
      productPrice: json["productPrice"],
    );
  }

  @override
  String toString() {
    return "imageUrl:$imageUrl,productName:$productName,productPieces:$productPieces,productPrice:$productPrice";
  }
}
