import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:e_commerce/cubit/products_state.dart';
import 'package:e_commerce/feature/pages/view_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  String searchType = 'Women';
  List<String> searchTypes = ['Women', 'Men', 'Kids'];

  void changeSearchType(int index) {
    searchType = searchTypes[index];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final productCubit = context.read<ProductsCubit>();
          return Form(
            child: TextFormField(
              controller: productCubit.search,
              onFieldSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewProductsPage(search: value),
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: AppColors.violetColor,
                filled: true,
                hint: Text(
                  'Search here',
                  style: AppTextStyle.body(
                    size: 12,
                    color: AppColors.borderColor,
                  ),
                ),
                prefixIcon: Image.asset(AppIcons.searchIcon),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppIcons.line),
                    const SizedBox(width: 10),
                    Text(searchType, style: AppTextStyle.body(size: 12)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PopupMenuButton(
                        color: AppColors.violetColor,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () => changeSearchType(0),
                            child: Text('Women', style: AppTextStyle.body()),
                          ),
                          PopupMenuItem(
                            onTap: () => changeSearchType(1),
                            child: Text('Men', style: AppTextStyle.body()),
                          ),
                          PopupMenuItem(
                            onTap: () => changeSearchType(2),
                            child: Text('Kids', style: AppTextStyle.body()),
                          ),
                        ],
                        child: Image.asset(AppIcons.arrowDown),
                      ),
                    ),
                    // PopupMenuButton(itemBuilder: (context) => []),
                  ],
                ),
              ),
              cursorColor: AppColors.secondryColor,
              style: AppTextStyle.body(),
            ),
          );
        },
      ),
    );
  }
}
