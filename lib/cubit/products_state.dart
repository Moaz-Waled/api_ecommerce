import 'package:e_commerce/core/models/categories/categories_model.dart';
import 'package:e_commerce/core/models/products/products_model.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class GetProductsLoading extends ProductsState {}

final class GetProductsFailure extends ProductsState {
  final String errorMessage;

  GetProductsFailure({required this.errorMessage});
}

final class GetProductsSuccess extends ProductsState {
  final List<ProductsModel> products;

  GetProductsSuccess({required this.products});
}

final class GetCategoriesLoading extends ProductsState {}

final class GetCategoriesFailure extends ProductsState {
  final String errorMessage;

  GetCategoriesFailure({required this.errorMessage});
}
final class GetCategoriesSuccess extends ProductsState {
  final List<CategoriesModel> categories;

  GetCategoriesSuccess({required this.categories});
}

final class GetAllProductsLoading extends ProductsState {}

final class GetAllProductsFailure extends ProductsState {
  final String errorMessage;

  GetAllProductsFailure({required this.errorMessage});
}

final class GetAllProductsSuccess extends ProductsState {
  final List<ProductsModel> products;

  GetAllProductsSuccess({required this.products});
}
