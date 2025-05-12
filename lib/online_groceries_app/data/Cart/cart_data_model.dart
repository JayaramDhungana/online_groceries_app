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

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(
      imageUrl: json["imageUrl"],
      productName: json["productName"],
      productPieces: json["productPieces"],
      productCount: json["productCount"],
      productPrice: json["productPrice"],
      initialProductPrice: json["initialProductPrice"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'productName': productName,
      'productPieces': productPieces,
      'productCount': productCount,
      'productPrice': productPrice,
      'initialProductPrice': initialProductPrice,
    };
  }

  @override
  String toString() {
    return "imageUrl:$imageUrl,productName:$productName,productPieces:$productPieces,productCount:$productCount,productPrice:$productPrice,initialProductPrice:$initialProductPrice";
  }
}
