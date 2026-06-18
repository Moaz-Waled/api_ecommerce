import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/categories/categories_model.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:e_commerce/feature/widgets/home_bar_title.dart';
import 'package:e_commerce/feature/widgets/home_navigation_bar.dart';
import 'package:e_commerce/feature/widgets/nonification_icon.dart';
import 'package:e_commerce/feature/widgets/products_title_bar.dart';
import 'package:e_commerce/feature/widgets/products_widget.dart';
import 'package:e_commerce/feature/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProductsPage extends StatefulWidget {
  final String? search;
  final CategoriesModel? category;
  final bool? favourites;

  const ViewProductsPage({
    super.key,
    this.category,
    this.search,
    this.favourites,
  });

  @override
  State<ViewProductsPage> createState() => _ViewProductsPageState();
}

class _ViewProductsPageState extends State<ViewProductsPage> {
  List<ProductsModel> products = [];
  int? currentIndex;

  @override
  void initState() {
    if (widget.favourites ?? false) {
      context.read<ProductsCubit>().getFavourites();
      setState(() {
        currentIndex = 2;
      });
    } else if (widget.search != null) {
      context.read<ProductsCubit>().searchProduct();
    } else if (widget.category != null) {
      context.read<ProductsCubit>().getCategoryProducts(widget.category!.slug);
    } else {
      context.read<ProductsCubit>().getAllProducts();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ViewProductsSuccess) {
          products = state.products;
        } else if (state is ViewProductsFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          bottomNavigationBar: HomeNavigationBar(currentIndex: currentIndex),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryColor,
            title: HomeBarTitle(),
            actions: [NotificationIcon(onTap: () {})],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchTextField(),
              const SizedBox(height: 16),
              ProductsTitleBar(
                category: widget.category,
                search: widget.search,
                favourites: widget.favourites,
              ),
              const SizedBox(height: 16),
              if (state is ViewProductsSuccess && products.isEmpty)
                Center(
                  child: Text(
                    widget.search != null
                        ? 'No result for \'${widget.search}\''
                        : 'No favourites',
                    style: AppTextStyle.body(size: 20),
                  ),
                ),
              state is ViewProductsLoading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 300),
                      child: CircularProgressIndicator(
                        color: AppColors.secondryColor,
                      ),
                    )
                  : state is ViewProductsFailure
                  ? Center(
                      child: Text(
                        "Somthing went wrong",
                        style: AppTextStyle.body(),
                      ),
                    )
                  : Expanded(child: ProductsWidget(products: products)),
            ],
          ),
        );
      },
    );
  }
}
