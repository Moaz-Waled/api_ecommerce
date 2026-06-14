import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/feature/pages/single_product.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  final List<ProductsModel> products;

  const ProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.5,
        crossAxisSpacing: 15,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        ProductsModel product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SingleProductPage(product: product),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ProductImageWidget(product: product),
                  if (product.discountPercentage.toInt() != 0)
                    DiscountRateWidget(product: product),
                  Positioned(
                    top: 7,
                    left: 160,
                    child: LikeProductWidget(product: product),
                  ),
                ],
              ),
              Text(product.title, style: AppTextStyle.body(size: 16)),
              ProductPriceWidget(product: product),
            ],
          ),
        );
      },
    );
  }
}

class LikeProductWidget extends StatefulWidget {
  final ProductsModel product;

  const LikeProductWidget({super.key, required this.product});

  @override
  State<LikeProductWidget> createState() => _LikeProductWidgetState();
}

class _LikeProductWidgetState extends State<LikeProductWidget> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        liked = !liked;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: Image.asset(liked ? AppIcons.redHeart : AppIcons.heart),
      ),
    );
  }
}

class DiscountRateWidget extends StatelessWidget {
  final ProductsModel product;

  const DiscountRateWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 7,
      left: 7,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 22,
        width: 52,
        alignment: Alignment.center,
        child: Text(
          '${(product.discountPercentage).toStringAsFixed(0)}% off',
          style: AppTextStyle.body(size: 10),
        ),
      ),
    );
  }
}

class ProductPriceWidget extends StatelessWidget {
  final ProductsModel product;

  const ProductPriceWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${((product.price) - ((product.price) * (product.discountPercentage / 100))).toStringAsFixed(2)}',
          style: AppTextStyle.body(size: 12),
        ),
        const SizedBox(width: 8),
        if (product.discountPercentage.toInt() != 0)
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: AppTextStyle.body(size: 10, color: AppColors.borderColor),
          ),
      ],
    );
  }
}

class ProductImageWidget extends StatelessWidget {
  final ProductsModel product;

  const ProductImageWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        image: DecorationImage(
          image: NetworkImage(product.images[0]),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      height: 250,
    );
  }
}
