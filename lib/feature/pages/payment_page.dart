import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/feature/widgets/general_button.dart';
import 'package:e_commerce/feature/widgets/payment_background.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: Stack(
          children: [
            Center(child: PaymentBackground()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: GeneralButton(
                  height: 56,
                  color: AppColors.secondryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: AppIcons.blackCart,
                  text: 'Continue Shopping',
                  textColor: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
