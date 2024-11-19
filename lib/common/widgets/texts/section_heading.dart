import 'package:flutter/material.dart';

import 'package:prayroz/utils/constants/colors.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, 
    this.textColor, 
    required this.title,
    this.buttonTitle  = "Show", 
    this.onPressed,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.black),maxLines: 1, overflow: TextOverflow.ellipsis,),
          if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
