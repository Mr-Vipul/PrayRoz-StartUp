import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget{
  const TSingleAddress({
  super.key,
  required this.selectedAddress,
  });
  final bool selectedAddress;

  @override

  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress? TColors.primary.withOpacity(0.5): Colors.transparent,
      borderColor: selectedAddress? Colors.transparent: dark? TColors.darkerGrey: TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 8,
            child:Icon( selectedAddress? Iconsax.tick_circle5: null,
                color: selectedAddress? dark ? TColors.light : TColors.dark: null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GGSIPU EDC, Vishwas Nagar, Shahdra, Delhi 110092',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm/2,),
              const Text('(+91-8800207681)', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.sm/2,),
              const Text('GGSIPU EDC, Vishwas Nagar, Shahdra, Delhi 110092'),
            ],
          )
        ],
      ),
    );
  }
}




