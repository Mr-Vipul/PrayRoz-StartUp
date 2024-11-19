import 'package:flutter/material.dart';
import 'package:prayroz/common/widgets/texts/product_price_text.dart';
import 'package:prayroz/common/widgets/texts/product_title_text.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        // TRoundedContainer(
        //   padding: const EdgeInsets.all(TSizes.md),
        //   // backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
        //   child: Column(
        //     children: [
        //       /// Title, Price, and Stock Status
        //       Row(
        //         children: [
        //           const TSectionHeading(title: 'Variation', showActionButton: false),
        //           const SizedBox(width: TSizes.spaceBtwItems),
        //
        //           Column(
        //             children: [
        //               Row(
        //                 children: [
        //                   const TProductTitleText(title: 'Price', smallSize: true,),
        //                   const SizedBox(width: TSizes.spaceBtwItems,),
        //
        //                   Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
        //                   ),
        //                   const SizedBox(width: TSizes.spaceBtwItems),
        //
        //                   ///Sale Price
        //                   const TProductPriceText(price: '20'),
        //                 ],
        //               ),
        //
        //               ///Stock
        //               Row(
        //                 children: [
        //                   const TProductTitleText(title: 'stock', smallSize: true,),
        //                   Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
        //                 ],
        //               ),
        //
        //
        //             ],
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Attributes
        Column(
          children: [

          ],
        )
      ],
    );
  }
}
