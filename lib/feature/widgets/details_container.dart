import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:e_commerce/core/models/products/products_model.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatefulWidget {
  final ProductsModel product;
  final String title;
  final bool forReviews;

  const DetailsContainer({
    super.key,
    required this.product,
    required this.title,
    required this.forReviews,
  });

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.violetColor,
        borderRadius: BorderRadius.circular(6),
      ),
      height: widget.forReviews && expanded
          ? 250
          : expanded && !widget.forReviews
          ? 100
          : 50,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: AppTextStyle.body(size: 12, weight: FontWeight.normal),
              ),
              GestureDetector(
                onTap: () {
                  expanded = !expanded;
                  setState(() {});
                },
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    expanded ? AppIcons.arrowDown : AppIcons.arrowRight,
                  ),
                ),
              ),
            ],
          ),
          if (expanded && !widget.forReviews)
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                  style: AppTextStyle.body(
                    size: 12,
                    color: AppColors.borderColor,
                    weight: FontWeight.normal,
                    family: 'Poppins',
                  ),
                ),
              ),
            ),
          if (expanded && widget.forReviews)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.product.reviews.length,
                itemBuilder: (context, index) {
                  final review = widget.product.reviews[index];
                  return ListTile(
                    title: Text(
                      review.reviewerName,
                      style: AppTextStyle.body(
                        size: 12,
                        weight: FontWeight.normal,
                      ),
                    ),
                    // const SizedBox(width: 5.0),
                    subtitle: Text(
                      review.comment,
                      style: AppTextStyle.body(
                        size: 12,
                        color: AppColors.borderColor,
                        weight: FontWeight.normal,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 12,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: review.rating,
                            itemBuilder: (context, index) => Image.asset(
                              AppIcons.yellowStar,
                              width: 12,
                              height: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5 - review.rating,
                            itemBuilder: (context, index) => Image.asset(
                              AppIcons.emptyStar,
                              width: 12,
                              height: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
