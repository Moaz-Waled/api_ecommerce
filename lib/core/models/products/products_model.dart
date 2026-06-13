import 'package:e_commerce/core/models/products/dimensions_model.dart';
import 'package:e_commerce/core/models/products/meta_model.dart';
import 'package:e_commerce/core/models/products/reviews_model.dart';

class ProductsModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final num discountPercentage;
  final double rating;
  final int stock;
  final List<dynamic> tags;
  final String? brand;
  final String sku;
  final int weight;
  final DimensionsModel dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewsModel> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final MetaModel meta;
  final List<dynamic> images;
  final String thumbnail;

  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: json['price'] as double,
      discountPercentage: json['discountPercentage'] as num,
      rating: json['rating'] as double,
      stock: json['stock'] as int,
      tags: json['tags'] as List<dynamic>,
      brand: json['brand'],
      sku: json['sku'] as String,
      weight: json['weight'] as int,
      dimensions: DimensionsModel.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation'] as String,
      shippingInformation: json['shippingInformation'] as String,
      availabilityStatus: json['availabilityStatus'] as String,
      reviews: (json['reviews'] as List)
          .map((e) => ReviewsModel.fromJson(e))
          .toList(),
      returnPolicy: json['returnPolicy'] as String,
      minimumOrderQuantity: json['minimumOrderQuantity'] as int,
      meta: MetaModel.fromJson(json['meta']),
      images: json['images'] as List<dynamic>,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
