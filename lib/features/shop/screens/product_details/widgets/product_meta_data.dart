import 'package:flutter/material.dart';
import 'package:prayroz/common/widgets/images/t_circular_images.dart';
import 'package:prayroz/common/widgets/texts/product_price_text.dart';
import 'package:prayroz/common/widgets/texts/product_title_text.dart';
import 'package:prayroz/common/widgets/texts/t_brand_title_text_with_vrified_icon.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    // final darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs,),
              child: Text('25% OFF', style: Theme.of(context).textTheme.labelLarge?.apply(color: TColors.black),),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            /// Original Price (Strikethrough)
            Text('\$250', style: Theme.of(context).textTheme.titleSmall?.copyWith(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(price: 'Rs.174', isLarge:true),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        /// Title
        const TProductTitleText(title: 'Mangaldeep Dhoop Battis with rse fragrance'),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        /// Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'status'),
            const SizedBox(height: TSizes.spaceBtwItems/1.5),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        
        ///Brand 
        const Row(
          children: [
            TCircularImage(
              image: TImages.dhoop,
              width:32,
              height:32,
              // overlayColor: darkMode ? TColors.white: TColors.black,
            ),
            
           TBrandTitleWithVerifiedIcon(title: 'Mangaldeep', brandTextSize: TextSizes.medium,)
        ],),
      ],
    );
  }
}
