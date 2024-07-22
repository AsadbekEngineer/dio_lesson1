import 'package:lesson1_dio/data/models/category_model.dart';

class Product {
  int id;
  String title;
  int price;
  String description;
  Categori category;
  List<String> images;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"] ?? 0,
      title: map["title"] ?? "",
      price: map["price"] ?? 0,
      description: map["description"] ?? "",
      category: Categori.fromMap(map["category"] ?? {}),
      images: List<String>.from(map["images"] ?? []),
    );
  }
}
