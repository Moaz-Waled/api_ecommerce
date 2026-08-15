import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/categories/categories_model.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:e_commerce/feature/widgets/banner_view.dart';
import 'package:e_commerce/feature/widgets/categories_widget.dart';
import 'package:e_commerce/feature/widgets/home_bar_title.dart';
import 'package:e_commerce/feature/widgets/home_navigation_bar.dart';
import 'package:e_commerce/feature/widgets/nonification_icon.dart';
import 'package:e_commerce/feature/widgets/products_title.dart';
import 'package:e_commerce/feature/widgets/products_widget.dart';
import 'package:e_commerce/feature/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categories = [];
  List<ProductsModel> products = [];
  ScrollController controller = ScrollController();
  bool ignoring = true;
  bool isLoadingMore = false;
  int skip = 0;
  bool end = false;

  @override
  void initState() {
    context.read<ProductsCubit>().getCategories();
    context.read<ProductsCubit>().getProductsWithPagination(skip: skip);
    controller.addListener(() {
      if (controller.position.atEdge) {
        ignoring = controller.position.pixels == 0.0;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is GetCategoriesSuccess) {
          categories = state.categories;
        }
        if (state is GetProductsLoading) {
          isLoadingMore = true;
        }
        if (state is GetProductsSuccess) {
          if (state.products.isEmpty) {
            end = true;
            isLoadingMore = false;
          } else {
            isLoadingMore = false;
            skip += 6;
            products.addAll(state.products);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          bottomNavigationBar: HomeNavigationBar(currentIndex: 0),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryColor,
            title: HomeBarTitle(),
            actions: [NotificationIcon(onTap: () {})],
          ),
          body:
              (state is GetCategoriesLoading || state is GetProductsLoading) &&
                  !isLoadingMore
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondryColor,
                  ),
                )
              : state is GetCategoriesFailure || state is GetProductsFailure
              ? Center(
                  child: Text(
                    'Somthing went wrong',
                    style: AppTextStyle.body(size: 16),
                  ),
                )
              : Column(
                  children: [
                    SearchTextField(),
                    Expanded(
                      child: ListView(
                        controller: controller,
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 16),
                          SizedBox(height: 200, child: BannersView()),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 45,
                            child: CategoriesWidget(categories: categories),
                          ),
                          const SizedBox(height: 32),
                          ProductsTitle(),
                          const SizedBox(height: 12),
                          Stack(
                            children: [
                              const SizedBox(height: 488),
                              SizedBox(
                                height: 488,
                                child: NotificationListener(
                                  onNotification:
                                      (ScrollNotification notification) {
                                        if (end || skip >= 30) {
                                          return false;
                                        }
                                        if (notification
                                                is ScrollEndNotification &&
                                            !isLoadingMore) {
                                          final pixels =
                                              notification.metrics.pixels;
                                          final max = notification
                                              .metrics
                                              .maxScrollExtent;
                                          final triggerDistance = 300;

                                          if (pixels >= max - triggerDistance) {
                                            context
                                                .read<ProductsCubit>()
                                                .getProductsWithPagination(
                                                  skip: skip,
                                                );
                                          }
                                        }
                                        return false;
                                      },
                                  child: ProductsWidget(
                                    products: products,
                                    ignoring: ignoring,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (isLoadingMore)
                            Center(
                              child: CircularProgressIndicator(
                                color: AppColors.secondryColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
