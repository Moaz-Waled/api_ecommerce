import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/feature/widgets/home_bar_title.dart';
import 'package:e_commerce/feature/widgets/nonification_icon.dart';
import 'package:e_commerce/feature/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: HomeBarTitle(),
        actions: [NotificationIcon(onTap: () {})],
      ),
      body: SearchTextField(),
    );
  }
}
