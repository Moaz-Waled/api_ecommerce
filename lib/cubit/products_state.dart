import 'package:e_commerce/core/models/products/products_model.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class Loading extends ProductsState {}

final class Failure extends ProductsState {
  final String errorMessage;

  Failure({required this.errorMessage});
}

final class GetProductsSuccess extends ProductsState {
  final List<ProductsModel> products;

  GetProductsSuccess({required this.products});
}
