import 'dart:convert';

class Product {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final double? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: num.tryParse(json["price"].toString())?.toDouble(),
        discountPercentage: num.tryParse(json["discountPercentage"].toString())?.toDouble(),
        rating: num.tryParse(json["rating"].toString())?.toDouble(),
        stock: num.tryParse(json["stock"].toString())?.toDouble(),
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images?.map((x) => x) ?? []),
      };
}