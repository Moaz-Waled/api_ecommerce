import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:flutter/material.dart';

class IconsContainer extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const IconsContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class ImagesViewElipses extends StatelessWidget {
  final ProductsModel product;
  final int imageIndex;

  const ImagesViewElipses({
    super.key,
    required this.product,
    required this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: product.images.length,
        itemBuilder: (context, index) {
          bool equal = index == imageIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              decoration: BoxDecoration(
                color: equal ? AppColors.secondryColor : AppColors.greyColor,
                borderRadius: equal
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(50),
              ),
              width: equal ? 12 : 6,
              height: 6,
            ),
          );
        },
      ),
    );
  }
}

class ProductImagesView extends StatelessWidget {
  final ProductsModel product;
  final void Function(int) onPageChanged;

  const ProductImagesView({
    super.key,
    required this.product,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 445,
      child: PageView.builder(
        itemCount: product.images.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: AppColors.secondryColor,
            image: DecorationImage(image: NetworkImage(product.images[index])),
          ),
          height: 445,
          width: double.infinity,
        ),
        onPageChanged: onPageChanged,
      ),
    );
  }
}
