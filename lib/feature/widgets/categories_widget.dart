import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Tops', 'image': AppImages.tops},
    {'name': 'Dress', 'image': AppImages.dress},
    {'name': 'Skirts', 'image': AppImages.skirts},
    {'name': 'Jeans', 'image': AppImages.jeans},
  ];

  CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Image.asset(categories[index]['image'], width: 90, height: 90),
              Text(
                categories[index]['name'],
                style: AppTextStyle.body(size: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
