import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/categories/categories_model.dart';
import 'package:flutter/material.dart';

class ProductsTitleBar extends StatelessWidget {
  final CategoriesModel? category;
  final String? search;

  const ProductsTitleBar({super.key, this.category, this.search});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(AppIcons.arrowLeft),
              ),
            ),
            Text(
              category == null && search == null
                  ? 'All Products'
                  : search == null
                  ? category!.name
                  : 'Results',
              style: AppTextStyle.body(family: 'InterMedium'),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(onTap: () {}, child: Image.asset(AppIcons.menu)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(onTap: () {}, child: Image.asset(AppIcons.edit)),
            ),
          ],
        ),
      ],
    );
  }
}
