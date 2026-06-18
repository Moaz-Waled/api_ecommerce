import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:e_commerce/feature/pages/payment_page.dart';
import 'package:e_commerce/feature/widgets/cart_items_details.dart';
import 'package:e_commerce/feature/widgets/cart_products.dart';
import 'package:e_commerce/feature/widgets/general_button.dart';
import 'package:e_commerce/feature/widgets/home_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductsModel> products = [];

  @override
  void initState() {
    context.read<ProductsCubit>().getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: HomeNavigationBar(currentIndex: 1),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        leadingWidth: 35,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(AppIcons.arrowLeft),
        ),
        title: Text(
          'Cart',
          style: AppTextStyle.body(
            family: 'InterMedium',
            weight: FontWeight.normal,
          ),
        ),
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is GetCartProductsSuccess) {
            products = state.products;
          }
        },
        builder: (context, state) {
          return state is GetCartProductsLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondryColor,
                  ),
                )
              : state is GetProductsFailure
              ? Center(
                  child: Text(
                    'Something went wrong',
                    style: AppTextStyle.body(
                      size: 16,
                      weight: FontWeight.normal,
                    ),
                  ),
                )
              : products.isEmpty
              ? Center(
                  child: Text(
                    'No products in cart',
                    style: AppTextStyle.body(
                      size: 16,
                      weight: FontWeight.normal,
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CartProducts(products: products),
                        CartItemsDetails(products: products),
                        const SizedBox(height: 32),
                        GeneralButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => PaymentPage(),
                              ),
                            );
                          },
                          height: 56,
                          color: AppColors.secondryColor,
                          icon: AppIcons.blackCart,
                          text: 'Checkout',
                          textColor: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
