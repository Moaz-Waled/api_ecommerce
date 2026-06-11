import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeBarTitle extends StatelessWidget {
  const HomeBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeBarTitleText(text: 'F'),
        Image.asset(AppIcons.bagIcon, width: 20, height: 20),
        HomeBarTitleText(text: 'sn'),
      ],
    );
  }
}

class HomeBarTitleText extends StatelessWidget {
  final String text;

  const HomeBarTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.heading(size: 24, weight: FontWeight.normal),
    );
  }
}
