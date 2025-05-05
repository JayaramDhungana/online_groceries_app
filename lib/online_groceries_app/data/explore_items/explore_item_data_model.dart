import 'dart:ui';

class ExploreItemDataModel {
  final String imageUrl;
  final String name;
  final Color color;
  final Color borderColor;

  ExploreItemDataModel({
    required this.imageUrl,
    required this.name,
    required this.color,
    required this.borderColor,
  });

  factory ExploreItemDataModel.fromJson(Map<String, dynamic> json) {
    return ExploreItemDataModel(
      imageUrl: json["imageUrl"],
      name: json["name"],
      color: json["color"],
      borderColor: json["borderColor"],
    );
  }
  @override
  String toString() {
    return "imageUrl:$imageUrl,name:$name,color:$color,borderColor:$borderColor";
  }
}
