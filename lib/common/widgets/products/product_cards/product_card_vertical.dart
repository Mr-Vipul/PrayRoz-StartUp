import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/common/styles/shadows.dart';
import 'package:prayroz/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:prayroz/common/widgets/images/t_round_images.dart';
import 'package:prayroz/common/widgets/texts/product_price_text.dart';
import 'package:prayroz/common/widgets/texts/product_title_text.dart';
import 'package:prayroz/common/widgets/texts/t_brand_title_text_with_vrified_icon.dart';
import 'package:prayroz/features/shop/screens/product_details/product_details.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          boxShadow: [TShadowStyle.verticalProductShadow],
          color: dark ? TColors.black : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail, wishlist button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  const Center(
                    child: TRoundImage(
                      imageUrl: TImages.pooja_1,
                      applyImageRadius: true,
                    ),
                  ),

                  /// Tag
                  Positioned(
                    top: 32,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        'UpComing',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// Favorite Icon Button
                  Positioned(
                    top: 18,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, dark: dark, color: Colors.redAccent,),
                  ),

                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Details
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: 'Pooja\'s', textAlign: TextAlign.center, smallSize: true,),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(title: 'MangalDeep'),
                  ],
                ),
              ),
            ),

            // Todo: Add spacer() here to keep the height
            const Spacer(),

            ///Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const TProductPriceText(price: '700',),
                const SizedBox(width: TSizes.sm),

                Container(
                  width: 45,
                  height: 45,
                  padding: const EdgeInsets.all(TSizes.xs),
                  decoration: const BoxDecoration(
                    color: TColors.accent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.20,
                    height: TSizes.iconLg * 1.20,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.White,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

