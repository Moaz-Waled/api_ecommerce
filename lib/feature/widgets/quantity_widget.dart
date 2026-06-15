import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  final int quantity;
  final void Function() ontMinusTap;
  final void Function() onPlusTap;

  const QuantityWidget({
    super.key,
    required this.quantity,
    required this.ontMinusTap,
    required this.onPlusTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffeaeaea),
            borderRadius: BorderRadius.circular(5),
          ),
          width: 76,
          height: 28,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: ontMinusTap,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(AppIcons.minus),
                ),
              ),
              Container(
                color: AppColors.secondryColor,
                width: 20,
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  quantity.toString().padLeft(2, '0'),
                  style: AppTextStyle.body(
                    size: 12,
                    color: AppColors.blackColor,
                    weight: FontWeight.normal,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onPlusTap,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(AppIcons.plus),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}