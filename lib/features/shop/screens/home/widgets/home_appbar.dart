import 'package:flutter/material.dart';
import 'package:prayroz/common/widgets/appbar/appbar.dart';
import 'package:prayroz/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:prayroz/utils/constants/colors.dart';
import 'package:prayroz/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,    style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.White,),),
          Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.White),),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: TColors.White,
        ),
      ],
    );
  }
}
