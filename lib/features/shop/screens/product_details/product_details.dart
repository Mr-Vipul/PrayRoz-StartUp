import 'package:flutter/material.dart';
import 'package:prayroz/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:prayroz/features/shop/screens/product_details/widgets/rating_share_widget.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/product_detail_iamge.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. Product Image Slider
            TProductImageSlider(dark: false),

            ///2.product details
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [

                  ///Rating and share
                  TRatingAndShare(),

                  ///price
                  TProductMetaData(),

                  ///attributes
                  // TProductAttributes(),


                  ///CheckoutButton

                  ///description



                  ///reviews



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




