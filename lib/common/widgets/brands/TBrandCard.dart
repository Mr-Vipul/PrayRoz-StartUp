import 'package:flutter/material.dart';
import 'package:prayroz/utils/constants/colors.dart'; // Replace with actual path for your color constants
import 'package:prayroz/utils/constants/sizes.dart'; // Replace with actual path for your sizes constants
import 'package:prayroz/utils/helpers/helper_functions.dart'; // Replace with actual path for your helper functions
import 'package:prayroz/common/widgets/images/t_circular_images.dart'; // Replace with actual path for your image widget
// import 'package:prayroz/utils/constants/images.dart';

import '../custom_shapes/containers/rounded_container.dart';
// Replace with actual path for your image constants

class TBrandCard extends StatelessWidget {
  const TBrandCard({super.key, this.onTap, required this.showBorder});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,  // Fixed the onTap issue

      child: TRoundedContainer(
        showBorder: showBorder,  // Corrected `showborder` to `showBorder`
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: '',  // Replace with actual image asset path
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),

            const SizedBox(width: TSizes.spaceBtwItems / 2),

            // Text Section
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Example title text - you can adjust this with your custom widget
                  Text(
                    'MangalDeep', // Replace with dynamic title if necessary
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // const SizedBox(height: TSizes.defaultSpace),
                  // Example subtitle text - you can adjust this as needed
                  Text(
                    '10+ options', // Replace with dynamic description if necessary
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
