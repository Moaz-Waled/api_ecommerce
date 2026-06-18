import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:flutter/material.dart';

class CartItemsDetails extends StatefulWidget {
  final List<ProductsModel> products;

  const CartItemsDetails({super.key, required this.products});

  @override
  State<CartItemsDetails> createState() => _CartItemsDetailsState();
}

class _CartItemsDetailsState extends State<CartItemsDetails> {
  double getAllProductsPrice() {
    double price = 0.0;
    for (int i = 0; i < widget.products.length; i++) {
      price +=
          ((widget.products[i].price) -
          (widget.products[i].price *
              (widget.products[i].discountPercentage / 100)));
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.violetColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                final product = widget.products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item ${(index + 1).toString().padLeft(2, '0')}',
                        style: AppTextStyle.body(
                          family: 'InterMedium',
                          weight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '\$${((product.price) - (product.price * (product.discountPercentage / 100))).toStringAsFixed(2)}',
                        style: AppTextStyle.body(
                          family: 'InterMedium',
                          weight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(thickness: 1.0, color: AppColors.borderColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: AppTextStyle.body(size: 16, weight: FontWeight.normal),
              ),
              Text(
                '\$${getAllProductsPrice().toStringAsFixed(2)}',
                style: AppTextStyle.body(size: 16, weight: FontWeight.normal),
              ),
            ],
          ),
          Divider(thickness: 1.0, color: AppColors.borderColor),
        ],
      ),
    );
  }
}
