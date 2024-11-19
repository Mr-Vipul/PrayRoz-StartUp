import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key, required this.title,  this.smallSize = false, this.maxLines = 2, this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;

final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize ? Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black): Theme.of(context).textTheme.titleSmall!.apply(color: Colors.black),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: textAlign,
    );
  }
}
