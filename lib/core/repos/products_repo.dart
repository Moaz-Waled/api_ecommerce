import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_consumer.dart';
import 'package:e_commerce/core/api/api_endpoint.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/models/categories/categories_model.dart';
import 'package:e_commerce/core/models/products/products_model.dart';

class ProductsRepo {
  final ApiConsumer api;

  ProductsRepo({required this.api});

  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      final response = await api.get(ApiEndpoint.getProducts);
      final products = (response['products'] as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList();
      return Right(products);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, List<CategoriesModel>>> getCategories() async {
    try {
      final response = await api.get(ApiEndpoint.getCategories);
      final categories = (response as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, List<ProductsModel>>> getAllProducts() async {
    try {
      final response = await api.get(
        ApiEndpoint.getProducts,
        queryPrameters: {'limit': 0},
      );
      final products = (response['products'] as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList();
      return Right(products);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, List<ProductsModel>>> getCategoryProducts(
    String categorySlug,
  ) async {
    try {
      final response = await api.get(
        ApiEndpoint.getCategoryProducts(categorySlug),
      );
      final products = (response['products'] as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList();
      return Right(products);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
