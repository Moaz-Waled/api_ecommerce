import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/categories/categories_model.dart';
import 'package:flutter/material.dart';

class ProductsTitleBar extends StatelessWidget {
  final CategoriesModel? category;
  final String? search;
  final bool? favourites;

  const ProductsTitleBar({
    super.key,
    this.category,
    this.search,
    this.favourites,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(AppIcons.arrowLeft),
                ),
              ),
            ),
            Text(
              (category == null && search == null && favourites == null)
                  ? 'All Products'
                  : (search == null && favourites == null && category != null)
                  ? category!.name
                  : (search == null && category == null && favourites != null)
                  ? 'Favourites'
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
