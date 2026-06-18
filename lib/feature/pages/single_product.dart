import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:e_commerce/feature/pages/payment_page.dart';
import 'package:e_commerce/feature/widgets/details_container.dart';
import 'package:e_commerce/feature/widgets/general_button.dart';
import 'package:e_commerce/feature/widgets/product_images_view.dart';
import 'package:e_commerce/feature/widgets/product_rating.dart';
import 'package:e_commerce/feature/widgets/products_widget.dart';
import 'package:e_commerce/feature/widgets/quantity_widget.dart';
import 'package:e_commerce/feature/widgets/single_product_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductPage extends StatefulWidget {
  final ProductsModel product;

  const SingleProductPage({super.key, required this.product});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  int imageIndex = 0;
  int quantity = 1;
  List<ProductsModel> similarProducts = [];

  void changePage(int value) {
    imageIndex = value;
    setState(() {});
  }

  void addQuantity() {
    if (quantity < 10) {
      quantity++;
      setState(() {});
    }
  }

  void removeQuantity() {
    if (quantity > 1) {
      quantity--;
      setState(() {});
    }
  }

  @override
  void initState() {
    context.read<ProductsCubit>().getSimilarProducts(widget.product.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is GetSimilarProductsSuccess) {
          similarProducts = state.products;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: state is GetSimilarProductsLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondryColor,
                  ),
                )
              : state is GetSimilarProductsFailure
              ? Center(child: Text('Somthing went wrong'))
              : Column(
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
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                style: AppTextStyle.body(
                                  size: 20,
                                  weight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                widget.product.category,
                                style: AppTextStyle.body(
                                  size: 12,
                                  color: AppColors.borderColor,
                                  weight: FontWeight.normal,
                                ),
                              ),
                              SingleProductPrice(product: widget.product),
                              ProductRatingWidget(product: widget.product),
                              const SizedBox(height: 12),
                              Text(
                                'Select Quantity',
                                style: AppTextStyle.body(
                                  family: 'InterMedium',
                                  weight: FontWeight.normal,
                                ),
                              ),
                              QuantityWidget(
                                quantity: quantity,
                                ontMinusTap: removeQuantity,
                                onPlusTap: addQuantity,
                              ),
                              const SizedBox(height: 32),
                              Row(
                                children: [
                                  Expanded(
                                    child: GeneralButton(
                                      onPressed: () {
                                        for (int i = 0; i < quantity; i++) {
                                          context
                                              .read<ProductsCubit>()
                                              .addToCart(widget.product.id);
                                        }
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text('Added To Cart'),
                                          ),
                                        );
                                      },
                                      icon: AppIcons.cart,
                                      text: 'Add to cart',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: GeneralButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => PaymentPage(),
                                          ),
                                        );
                                      },
                                      color: AppColors.secondryColor,
                                      textColor: AppColors.blackColor,
                                      icon: AppIcons.blackBag,
                                      text: 'Buy now',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              DetailsContainer(
                                product: widget.product,
                                title: 'Product Details',
                                forReviews: false,
                              ),
                              const SizedBox(height: 8.0),
                              DetailsContainer(
                                product: widget.product,
                                title: 'Rating & Reviews',
                                forReviews: true,
                              ),
                              const SizedBox(height: 32),
                              Text(
                                'Similar Products',
                                style: AppTextStyle.body(
                                  weight: FontWeight.normal,
                                  family: 'InterMedium',
                                ),
                              ),
                              const SizedBox(height: 12),
                              ProductsWidget(products: similarProducts),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
