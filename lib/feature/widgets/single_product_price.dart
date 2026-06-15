import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:flutter/material.dart';

class SingleProductPrice extends StatelessWidget {
  const SingleProductPrice({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${((product.price) - (product.price * (product.discountPercentage / 100))).toStringAsFixed(2)}',
          style: AppTextStyle.body(size: 16, weight: FontWeight.normal),
        ),
        const SizedBox(width: 8),
        if (product.discountPercentage.toInt() != 0)
          Text(
            '\$${(product.price).toStringAsFixed(2)}',
            style: AppTextStyle.body(
              size: 18,
              color: AppColors.borderColor,
              weight: FontWeight.normal,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        const SizedBox(width: 12),
        if (product.discountPercentage.toInt() != 0)
          Text(
            '${product.discountPercentage.toStringAsFixed(0)}% OFF',
            style: AppTextStyle.body(
              size: 12,
              color: AppColors.redColor,
              weight: FontWeight.normal,
            ),
          ),
      ],
    );
  }
}
