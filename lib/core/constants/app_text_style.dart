import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppTextStyle {
  static TextStyle heading({double? size, Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: size ?? 28,
      fontWeight: weight ?? FontWeight.w600,
      fontFamily: 'Poppins',
      color: color ?? AppColors.secondryColor,
    );
  }

  static TextStyle body({double? size, Color? color, FontWeight? weight, String? family}) {
    return TextStyle(
      fontSize: size ?? 14,
      fontWeight: weight ?? FontWeight.w400,
      fontFamily: family ?? 'PoppinsMedium',
      color: color ?? AppColors.secondryColor,
    );
  }
}
