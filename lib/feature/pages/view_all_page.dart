import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:e_commerce/feature/widgets/products_widget.dart';
import 'package:e_commerce/feature/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({super.key});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  List<ProductsModel> products = [];

  @override
  void initState() {
    context.read<ProductsCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is GetAllProductsSuccess) {
          products = state.products;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            iconTheme: IconThemeData(color: AppColors.secondryColor),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchTextField(),
              const SizedBox(height: 32),
              state is GetAllProductsLoading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 300),
                      child: CircularProgressIndicator(
                        color: AppColors.secondryColor,
                      ),
                    )
                  : state is GetAllProductsFailure
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
