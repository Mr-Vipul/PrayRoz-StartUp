import 'package:flutter/material.dart';
import 'package:prayroz/utils/constants/colors.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
    required this.dark,
  });

  final double? width, height, size;

  final IconData icon;

  final Color? color;

  final Color? backgroundColor;

  final VoidCallback? onPressed;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,

      height: height,

      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.White.withOpacity(0.9),
        // color: backgroundColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ), // BoxDecoration

      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
