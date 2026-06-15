import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:flutter/material.dart';

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      child: Row(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: int.parse(product.rating.toStringAsFixed(0)),
            itemBuilder: (context, index) => Image.asset(AppIcons.yellowStar),
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5 - int.parse(product.rating.toStringAsFixed(0)),
            itemBuilder: (context, index) => Image.asset(AppIcons.emptyStar),
          ),
          const SizedBox(width: 8),
          Text(
            '(${product.reviews.length})',
            style: AppTextStyle.body(size: 12, weight: FontWeight.normal),
          ),
          const SizedBox(width: 8),
          Text(
            'Reviews',
            style: AppTextStyle.body(size: 12, weight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
