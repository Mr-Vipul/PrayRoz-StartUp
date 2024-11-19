import 'package:flutter/material.dart';
import 'package:prayroz/common/widgets/layouts/grid_layout.dart';
import 'package:prayroz/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:prayroz/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart'; // Fixed import path
import '../../../../../utils/constants/image_strings.dart'; // Fixed import path
import '../../../../../utils/constants/sizes.dart'; // Fixed import path

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const TBrandShowcase(images: [TImages.dhoop, TImages.dhoop, TImages.dhoop,],),
              const TBrandShowcase(images: [TImages.dhoop, TImages.dhoop, TImages.dhoop,],),

              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(title: 'You might Like', showActionButton: true, onPressed: (){},),

              const SizedBox(height: TSizes.spaceBtwItems,),

              TGridLayout(itemCount: 4, itemBuilder: (_,index) => const TProductCardVertical()),
              const SizedBox(height: TSizes.spaceBtwSections),

              // You can add more widgets for products here as needed
            ],
          ),
        ),
      ]
    );
  }
}
