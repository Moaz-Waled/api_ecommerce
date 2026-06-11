import 'package:e_commerce/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final void Function() onTap;

  const NotificationIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: Image.asset(AppIcons.bellIcon));
  }
}
