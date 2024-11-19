import 'package:flutter/material.dart';
import 'package:prayroz/common/widgets/images/t_circular_images.dart';
import 'package:prayroz/common/widgets/layouts/grid_layout.dart';
import 'package:prayroz/features/shop/screens/store/widgets/category_tab.dart';
import 'package:prayroz/utils/constants/enums.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/texts/t_brand_title_text_with_vrified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart), // Replace `TCartCounterIcon` if it's a custom widget
              onPressed: () {
                // Handle cart button press
              },
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// -- Featured Brands
                      TSectionHeading(title: 'Featured Brands', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(itemCount: 4, mainAxisExtent:80, itemBuilder: (_,index){
                        return GestureDetector(
                          onTap: () {},
                          child: TRoundedContainer(
                            padding: const EdgeInsets.all(TSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                /// -- Icon Container
                                Flexible(
                                  child: TCircularImage(
                                    isNetworkImage: true,
                                    image: "https://www.bigbasket.com/media/uploads/p/xxl/1231262_1-mangaldeep-mogra-dhoop.jpg",
                                    backgroundColor: Colors.transparent,
                                    overlayColor: THelperFunctions.isDarkMode(context)
                                        ? TColors.white
                                        : TColors.white,
                                  ),
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems / 2),

                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const TBrandTitleWithVerifiedIcon(
                                        title: 'Dhoop',
                                        brandTextSize: TextSizes.large,
                                      ),
                                      Text(
                                        '250+ Items',
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        Theme.of(context).textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),

                bottom: const TabBar(
                  tabs: [
                      Tab(child: Text('Flowers')),
                      Tab(child: Text('Hawan Samagri')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Prasad')),
                      Tab(child: Text('Books')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),

          ],)
        ),
      ),
    );
  }
}


