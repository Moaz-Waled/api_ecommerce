import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class SplashIcon extends StatelessWidget {
  const SplashIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SplashText(text: 'F'),
        Image.asset(AppIcons.bagIcon),
        SplashText(text: 'sn'),
      ],
    );
  }
}

class SplashText extends StatelessWidget {
  final String text;

  const SplashText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.heading(size: 60, weight: FontWeight.normal),
    );
  }
}
