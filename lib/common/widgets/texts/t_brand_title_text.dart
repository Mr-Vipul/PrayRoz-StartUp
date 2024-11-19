import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: _getTextStyle(context),
    );
  }

  TextStyle? _getTextStyle(BuildContext context) {
    switch (brandTextSize) {
      case TextSizes.small:
        return Theme.of(context).textTheme.labelMedium?.apply(color: color);
      case TextSizes.medium:
        return Theme.of(context).textTheme.bodyLarge?.apply(color: color);
      case TextSizes.large:
        return Theme.of(context).textTheme.titleLarge?.apply(color: color);
      default:
        return Theme.of(context).textTheme.bodyMedium?.apply(color: color);
    }
  }
}
