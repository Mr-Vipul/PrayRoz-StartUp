import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);

    return const Column(
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
        SizedBox(height: TSizes.spaceBtwItems),

        ///Attributes
        Column(
          children: [

          ],
        )
      ],
    );
  }
}
