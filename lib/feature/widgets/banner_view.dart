import 'package:e_commerce/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class BannersView extends StatelessWidget {
  BannersView({super.key});

  final List<String> banners = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: banners.length,
      itemBuilder: (context, index) {
        return Image.asset(banners[index], width: double.infinity, height: 194);
      },
    );
  }
}
