import 'package:flutter/material.dart';
import 'package:prayroz/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:prayroz/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:prayroz/common/widgets/layouts/grid_layout.dart';
import 'package:prayroz/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:prayroz/common/widgets/texts/section_heading.dart';
import 'package:prayroz/features/shop/screens/home/home_categories.dart';
import 'package:prayroz/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:prayroz/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/constants/sizes.dart';

// import '../../../../../utils/constants/image_strings.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [


                  // AppBar
                  THomeAppBar(),
                  SizedBox(height: 10,),

                  // SearchBar
                  TSearchContainer(text: 'Search for your Service',),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  // Categories
                  Padding(padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                      TSectionHeading(showActionButton: false, title: 'Explore PrayRoz!',),
                      SizedBox(height: TSizes.spaceBtwItems,),


                        // Catagories
                        THomeCategories(),
                        SizedBox(height: TSizes.spaceBtwSections,)
                      ],
                    ),
                  )

                  // Add your other components like SearchBar and Categories here
                ],
              ),
            ),


          //  Body--corousel
            Padding(
              padding: const EdgeInsets.all(8),
              // padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [TImages.caros_1, TImages.caros_2, TImages.caros_3],),

                  const SizedBox(height: TSizes.spaceBtwItems,),


                  //Popular Services
                TGridLayout(itemCount: 4, itemBuilder: (_ , index ) => const TProductCardVertical(),),

                  // const TProductCardVertical(),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}



