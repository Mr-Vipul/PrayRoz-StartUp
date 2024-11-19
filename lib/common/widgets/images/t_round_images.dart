import 'package:flutter/cupertino.dart';

import '../../../utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:prayroz/utils/constants/sizes.dart';


class TRoundImage extends StatelessWidget {
  const TRoundImage({
    super.key,
    this.width ,
    this.height,
    required this.imageUrl,
    this.applyImageRadius  = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage =  false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,

            borderRadius: BorderRadius.circular(TSizes.md)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(TSizes.md),
          child: Image( fit: fit, image: isNetworkImage? NetworkImage(imageUrl): AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
