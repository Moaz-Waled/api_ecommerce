import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/feature/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatefulWidget {
  final ProductsModel product;

  const SingleProductPage({super.key, required this.product});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  int imageIndex = 0;

  void changePage(int value) {
    imageIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ProductImagesView(
                product: widget.product,
                onPageChanged: changePage,
              ),
              if (widget.product.images.length > 1)
                Positioned(
                  top: 400,
                  left: 180,
                  child: ImagesViewElipses(
                    product: widget.product,
                    imageIndex: imageIndex,
                  ),
                ),
              Positioned(
                top: 50,
                left: 30,
                child: IconsContainer(
                  child: Image.asset(AppIcons.blackArrowLeft),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 50,
                left: 350,
                child: IconsContainer(
                  child: Image.asset(AppIcons.share),
                  onTap: () {},
                ),
              ),
              Positioned(
                top: 380,
                left: 350,
                child: LikeProductWidget(product: widget.product),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.product.title,
              style: AppTextStyle.body(size: 20, weight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.product.category,
              style: AppTextStyle.body(
                size: 12,
                color: AppColors.borderColor,
                weight: FontWeight.normal,
              ),
            ),
          ),
          SingleProductPrice(product: widget.product),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ProductRatingWidget(product: widget.product),
          ),
        ],
      ),
    );
  }
}

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      child: Row(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: int.parse(product.rating.toStringAsFixed(0)),
            itemBuilder: (context, index) => Image.asset(AppIcons.yellowStar),
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5 - int.parse(product.rating.toStringAsFixed(0)),
            itemBuilder: (context, index) => Image.asset(AppIcons.emptyStar),
          ),
          const SizedBox(width: 8),
          Text(
            '(${product.reviews.length})',
            style: AppTextStyle.body(size: 12, weight: FontWeight.normal),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Text(
              'See Reviews',
              style: AppTextStyle.body(size: 12, weight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleProductPrice extends StatelessWidget {
  const SingleProductPrice({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Text(
            '\$${((product.price) - (product.price * (product.discountPercentage / 100))).toStringAsFixed(2)}',
            style: AppTextStyle.body(size: 16, weight: FontWeight.normal),
          ),
          const SizedBox(width: 8),
          if (product.discountPercentage.toInt() != 0)
            Text(
              '\$${(product.price).toStringAsFixed(2)}',
              style: AppTextStyle.body(
                size: 18,
                color: AppColors.borderColor,
                weight: FontWeight.normal,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          const SizedBox(width: 12),
          if (product.discountPercentage.toInt() != 0)
            Text(
              '${product.discountPercentage.toStringAsFixed(0)}% OFF',
              style: AppTextStyle.body(
                size: 12,
                color: AppColors.redColor,
                weight: FontWeight.normal,
              ),
            ),
        ],
      ),
    );
  }
}

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
