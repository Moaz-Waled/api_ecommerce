import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/feature/pages/home_page.dart';
import 'package:e_commerce/feature/widgets/splash_icon.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> navigateToHome() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => HomePage()),
      (route) => false,
    );
  }

  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SplashIcon()),
    );
  }
}
