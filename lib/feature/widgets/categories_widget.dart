import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/categories/categories_model.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<CategoriesModel> categories;

  const CategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 90,
              height: 45,
              alignment: Alignment.center,
              child: Text(
                category.name,
                style: AppTextStyle.body(
                  color: AppColors.primaryColor,
                  size: 12,
                  weight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
