class BeveragesDataModel {
  final String imageUrl;
  final String productName;
  final String productPieces;
  final String productPrice;

  BeveragesDataModel({
    required this.imageUrl,
    required this.productName,
    required this.productPieces,
    required this.productPrice,
  });

  factory BeveragesDataModel.fromJson(Map<String, dynamic> json) {
    return BeveragesDataModel(
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
