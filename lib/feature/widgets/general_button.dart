import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final void Function() onPressed;
  final Color? color;
  final String icon;
  final String text;
  final Color? textColor;
  final double? height;

  const GeneralButton({
    super.key,
    required this.onPressed,
    this.color,
    required this.icon,
    required this.text,
    this.textColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
        side: BorderSide(width: 1.5, color: AppColors.secondryColor),
      ),
      color: color,
      height: height ?? 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTextStyle.body(
              size: 16,
              weight: FontWeight.normal,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
