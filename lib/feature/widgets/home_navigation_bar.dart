import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primaryColor,
      currentIndex: currentIndex,
      onTap: (value) {
        currentIndex = value;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(AppIcons.home),
          activeIcon: Image.asset(AppIcons.activeHome),
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
