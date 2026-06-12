import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/feature/widgets/banner_view.dart';
import 'package:e_commerce/feature/widgets/categories_widget.dart';
import 'package:e_commerce/feature/widgets/home_bar_title.dart';
import 'package:e_commerce/feature/widgets/home_navigation_bar.dart';
import 'package:e_commerce/feature/widgets/nonification_icon.dart';
import 'package:e_commerce/feature/widgets/products_title.dart';
import 'package:e_commerce/feature/widgets/products_widget.dart';
import 'package:e_commerce/feature/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: HomeNavigationBar(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: HomeBarTitle(),
        actions: [NotificationIcon(onTap: () {})],
      ),
      body: Column(
        children: [
          SearchTextField(),
          const SizedBox(height: 16),
          SizedBox(height: 200, child: BannersView()),
          const SizedBox(height: 24),
          SizedBox(height: 135, child: CategoriesWidget()),
          ProductsTitle(),
          const SizedBox(height: 12),
          Expanded(child: ProductsWidget()),
        ],
      ),
    );
  }
}
