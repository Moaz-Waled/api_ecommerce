import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class PaymentBackground extends StatelessWidget {
  const PaymentBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppIcons.payment),
        const SizedBox(height: 32),
        Text(
          'Payment Successful',
          style: AppTextStyle.body(
            size: 24,
            color: Color(0xff05f300),
            family: 'PoppinsSemiBold',
            weight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: 248,
          child: Text(
            'Satisfied conveying dependent contented he gentleman',
            style: AppTextStyle.body(
              family: 'InterMedium',
              weight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
