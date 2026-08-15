import 'package:e_commerce/cache/cache_helper.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  final TextEditingController search = TextEditingController();

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final response = await productsRepo.getProducts();

    response.fold(
      (errorMessage) => emit(GetProductsFailure(errorMessage: errorMessage)),
      (products) => emit(GetProductsSuccess(products: products)),
    );
  }

  Future<void> getProductsWithPagination({required int skip}) async {
    emit(GetProductsLoading());
    final response = await productsRepo.getProductsWithPagination(skip: skip);

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

  Future<void> getAllProducts({required int skip}) async {
    emit(ViewProductsLoading());
    final response = await productsRepo.getProductsWithPagination(skip: skip);

    response.fold(
      (errorMessage) => emit(ViewProductsFailure(errorMessage: errorMessage)),
      (products) => emit(ViewProductsSuccess(products: products)),
    );
  }

  Future<void> getCategoryProducts(String categorySlug, {required int skip}) async {
    emit(ViewProductsLoading());
    final response = await productsRepo.getCategoryProducts(categorySlug, skip: skip);

    response.fold(
      (errorMessage) => emit(ViewProductsFailure(errorMessage: errorMessage)),
      (products) => emit(ViewProductsSuccess(products: products)),
    );
  }

  Future<void> searchProduct({required int skip}) async {
    emit(ViewProductsLoading());
    final response = await productsRepo.searchProduct(search.text, skip: skip);

    response.fold(
      (errorMessage) => emit(ViewProductsFailure(errorMessage: errorMessage)),
      (products) => emit(ViewProductsSuccess(products: products)),
    );
  }

  void addToFavourites(int id) {
    List<String> favourites =
        CacheHelper().getDataStringList(key: 'favourites') ?? [];
    favourites.add(id.toString());
    CacheHelper().saveData(key: 'favourites', value: favourites);
    emit(ToggleFavourite());
  }

  void removeFromFavourites(int id) {
    List<String> favourites;
    favourites = CacheHelper().getDataStringList(key: 'favourites')!;
    favourites.remove(id.toString());
    CacheHelper().saveData(key: 'favourites', value: favourites);
    emit(ToggleFavourite());
  }

  List<String> getFavouritesId() {
    return CacheHelper().getDataStringList(key: 'favourites') ?? [];
  }

  Future<void> getFavourites() async {
    emit(ViewProductsLoading());
    final response = await productsRepo.getFavouriteProducts();

    response.fold(
      (errorMessage) => emit(ViewProductsFailure(errorMessage: errorMessage)),
      (products) => emit(ViewProductsSuccess(products: products)),
    );
  }

  Future<void> getSimilarProducts(String categorySlug) async {
    emit(GetSimilarProductsLoading());
    final response = await productsRepo.getSimilarProducts(categorySlug);

    response.fold(
      (errorMessage) =>
          emit(GetSimilarProductsFailure(errorMessage: errorMessage)),
      (products) => emit(GetSimilarProductsSuccess(products: products)),
    );
  }

  void addToCart(int id) {
    List<String> cartId = CacheHelper().getDataStringList(key: 'cart') ?? [];
    if (cartId.contains(id.toString())) {
      final idList = [];
      for (int i = 0; i < cartId.length; i++) {
        if (cartId[i] == id.toString()) {
          idList.add(cartId[i]);
        }
      }
      if (idList.length >= 10) return;
    }
    cartId.add(id.toString());
    CacheHelper().saveData(key: 'cart', value: cartId);
  }

  void rmoveFromCart(int id) {
    List<String> cartId = CacheHelper().getDataStringList(key: 'cart')!;
    cartId.remove(id.toString());
    CacheHelper().saveData(key: 'cart', value: cartId);
  }

  Future<void> getCartProducts() async {
    emit(GetCartProductsLoading());
    final response = await productsRepo.getCartProducts();

    response.fold(
      (errorMessage) =>
          emit(GetCartProductsFailure(errorMessage: errorMessage)),
      (products) => emit(GetCartProductsSuccess(products: products)),
    );
  }

  void cartCheckOut() {
    CacheHelper().removeData(key: 'cart');
  }
}
