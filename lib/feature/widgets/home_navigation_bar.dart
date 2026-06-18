import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/feature/pages/cart_page.dart';
import 'package:e_commerce/feature/pages/home_page.dart';
import 'package:e_commerce/feature/pages/view_products_page.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  final int? currentIndex;

  const HomeNavigationBar({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primaryColor,
      currentIndex: currentIndex ?? 0,
      onTap: (value) {
        if (value == 2 && value != currentIndex) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ViewProductsPage(favourites: true),
            ),
          );
        } else if (value == 0 && value != currentIndex) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false,
          );
        } else if (value == 1 && value != currentIndex) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CartPage()));
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(AppIcons.home),
          activeIcon: Image.asset(AppIcons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppIcons.cart),
          activeIcon: Image.asset(
            AppIcons.cart,
            color: AppColors.secondryColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppIcons.favourites),
          activeIcon: Image.asset(
            AppIcons.favourites,
            color: AppColors.secondryColor,
          ),
          label: '',
        ),
      ],
    );
  }
}
