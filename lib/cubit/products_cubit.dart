import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(Loading());
    final response = await productsRepo.getProducts();

    response.fold(
      (errorMessage) => emit(Failure(errorMessage: errorMessage)),
      (products) => emit(GetProductsSuccess(products: products)),
    );
  }
}
