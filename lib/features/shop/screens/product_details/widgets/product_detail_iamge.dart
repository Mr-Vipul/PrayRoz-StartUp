import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_round_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final dark  = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidgets(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(height:400,
                child: Padding(
                  padding:const EdgeInsets.all(TSizes.productImageRadius*2),
                  child: Center(child: Image.asset(TImages.dhoop,),),
                )
            ),

            /// image slider
            Positioned(
              right:0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder:(_,__) => const SizedBox(width: TSizes.spaceBtwItems), itemCount: 6, itemBuilder: (_, index) =>TRoundImage(
                  width:80,
                  // backgroundColor: dark? TColors.white: TColors.white,
                  border: Border.all(color: TColors.primary),
                  padding: const EdgeInsets.all(TSizes.sm),
                  imageUrl: TImages.dhoop,
                ),

                ),
              ),
            ),

            ///Appbar
            const TAppBar(
              showBackArrow: true,
              actions: [ TCircularIcon(icon: Iconsax.heart5, color:Colors.red, dark: false,)],
            )
          ],
        ),
      ),
    );
  }
}