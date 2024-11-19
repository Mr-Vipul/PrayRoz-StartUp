import 'package:flutter/material.dart';

import 'TBrandCard.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),

          ///
          Row(children: images.map((image) => brandTopProductImageWidgets(image, context)).toList()),

        ],

      ),
    );
  }

  Widget brandTopProductImageWidgets(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        height: 100,
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image), // Dynamically use the passed `image`
        ),
      ),
    );
  }
}