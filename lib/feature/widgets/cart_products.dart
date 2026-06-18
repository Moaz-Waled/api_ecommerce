import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProducts extends StatelessWidget {
  final List<ProductsModel> products;

  const CartProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final productCubit = context.read<ProductsCubit>();
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.violetColor,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 130,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondryColor,
                        image: DecorationImage(
                          image: NetworkImage(product.images[0]),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 16.0),
                    SizedBox(
                      width: 180,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: AppTextStyle.body(
                                size: 18,
                                weight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '\$${((product.price) - (product.price * (product.discountPercentage / 100))).toStringAsFixed(2)}',
                              style: AppTextStyle.body(
                                family: 'InterMedium',
                                weight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: IconButton(
                    onPressed: () {
                      productCubit.rmoveFromCart(product.id);
                      productCubit.getCartProducts();
                    },
                    icon: Image.asset(AppIcons.delete),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
