import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final response = await productsRepo.getProducts();

    response.fold(
      (errorMessage) => emit(GetProductsFailure(errorMessage: errorMessage)),
      (products) => emit(GetProductsSuccess(products: products)),
    );
  }

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final response = await productsRepo.getCategories();

    response.fold(
      (errorMessage) => emit(GetCategoriesFailure(errorMessage: errorMessage)),
      (categories) => emit(GetCategoriesSuccess(categories: categories)),
    );
  }

  Future<void> getAllProducts() async {
    emit(ViewProductsLoading());
    final response = await productsRepo.getAllProducts();

    response.fold(
      (errorMessage) => emit(ViewProductsFailure(errorMessage: errorMessage)),
      (products) => emit(ViewProductsSuccess(products: products)),
    );
  }

  Future<void> getCategoryProducts(String categorySlug) async {
    emit(ViewProductsLoading());
    final response = await productsRepo.getCategoryProducts(categorySlug);

    response.fold(
      (errorMessage) => emit(ViewProductsFailure(errorMessage: errorMessage)),
      (products) => emit(ViewProductsSuccess(products: products)),
    );
  }
}
