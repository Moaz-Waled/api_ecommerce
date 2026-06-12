import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'One shoulder Top',
      'price': 15.00,
      'hasDiscount': true,
      'discount': 0.20,
      'priceAfterDiscount': 10.00,
      'image': AppImages.product1,
      'liked': false,
    },
    {
      'name': 'Cinched Waist Top',
      'price': 8.00,
      'hasDiscount': false,
      'discount': 0.00,
      'priceAfterDiscount': 8.00,
      'image': AppImages.product2,
      'liked': false,
    },
    {
      'name': 'Off Shoulder Top',
      'price': 6.00,
      'hasDiscount': false,
      'discount': 0.00,
      'priceAfterDiscount': 6.00,
      'image': AppImages.product3,
      'liked': false,
    },
    {
      'name': 'Crop Top',
      'price': 6.00,
      'hasDiscount': true,
      'discount': 0.33,
      'priceAfterDiscount': 4.00,
      'image': AppImages.product4,
      'liked': false,
    },
  ];

  ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.66,
        crossAxisSpacing: 15,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ProductImageWidget(products: products, index: index),
              if (products[index]['hasDiscount'])
                DiscountRateWidget(products: products, index: index),
              LikeProductWidget(products: products, index: index),
            ],
          ),
          Text(products[index]['name'], style: AppTextStyle.body(size: 16)),
          ProductPriceWidget(products: products, index: index),
        ],
      ),
    );
  }
}

class LikeProductWidget extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final int index;

  const LikeProductWidget({
    super.key,
    required this.products,
    required this.index,
  });

  @override
  State<LikeProductWidget> createState() => _LikeProductWidgetState();
}

class _LikeProductWidgetState extends State<LikeProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 7,
      left: 160,
      child: InkWell(
        onTap: () {
          widget.products[widget.index]['liked'] =
              !widget.products[widget.index]['liked'];
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
          child: Image.asset(
            widget.products[widget.index]['liked']
                ? AppIcons.redHeart
                : AppIcons.heart,
          ),
        ),
      ),
    );
  }
}

class DiscountRateWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int index;

  const DiscountRateWidget({
    super.key,
    required this.products,
    required this.index,
  });

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
          '${(products[index]['discount'] * 100).toStringAsFixed(0)}% off',
          style: AppTextStyle.body(size: 10),
        ),
      ),
    );
  }
}

class ProductPriceWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int index;

  const ProductPriceWidget({
    super.key,
    required this.products,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${products[index]['priceAfterDiscount'].toStringAsFixed(2)}',
          style: AppTextStyle.body(size: 12),
        ),
        const SizedBox(width: 8),
        if (products[index]['hasDiscount'])
          Text(
            '\$${products[index]['price'].toStringAsFixed(2)}',
            style: AppTextStyle.body(size: 10, color: AppColors.borderColor),
          ),
      ],
    );
  }
}

class ProductImageWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int index;

  const ProductImageWidget({
    super.key,
    required this.products,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(products[index]['image']),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      height: 250,
    );
  }
}
