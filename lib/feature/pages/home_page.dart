import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
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
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is Failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is GetProductsSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Done')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          bottomNavigationBar: HomeNavigationBar(),
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: HomeBarTitle(),
            actions: [NotificationIcon(onTap: () {})],
          ),
          body: Column(
            children: [
              SearchTextField(),
              const SizedBox(height: 16),
              SizedBox(height: 200, child: BannersView()),
              const SizedBox(height: 24),
              SizedBox(height: 135, child: CategoriesWidget()),
              ProductsTitle(),
              const SizedBox(height: 12),
              state is Loading
                  ? Center(child: CircularProgressIndicator())
                  : state is Failure
                  ? Text(
                      'Something went wrong',
                      style: AppTextStyle.body(size: 14),
                    )
                  : Expanded(
                      child: ProductsWidget(
                        products: (state as GetProductsSuccess).products,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
