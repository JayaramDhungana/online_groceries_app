class ExclusiveOfferDataModel {
  final String imageUrl;
  final String productName;
  final String productPieces;
  final String productPrice;

  ExclusiveOfferDataModel({
    required this.imageUrl,
    required this.productName,
    required this.productPieces,
    required this.productPrice,
  });

  factory ExclusiveOfferDataModel.fromJson(Map<String, dynamic> json) {
    return ExclusiveOfferDataModel(
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
