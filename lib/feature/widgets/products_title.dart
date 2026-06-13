import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/feature/pages/view_products_page.dart';
import 'package:flutter/material.dart';

class ProductsTitle extends StatelessWidget {
  const ProductsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Latest', style: AppTextStyle.body(size: 20)),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => ViewProductsPage()));
          },
          child: Text(
            'View all',
            style: AppTextStyle.body(size: 12, color: AppColors.borderColor),
          ),
        ),
      ],
    );
  }
}
