import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/common/widgets/appbar/appbar.dart';
import 'package:prayroz/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:prayroz/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:prayroz/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:prayroz/common/widgets/texts/section_heading.dart';
import 'package:prayroz/features/personalization/screens/profile/profile.dart';
import 'package:prayroz/utils/constants/colors.dart';
import 'package:prayroz/utils/constants/sizes.dart';

import '../address/address.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.White),),),
                  // const SizedBox(height: TSizes.spaceBtwSections,),

                  // User Profile Card
                 TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  ],
                  ),
            ),

            // --body
             Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                    children: [
                      // Account Setting
                      const TSectionHeading(title: 'Account Settings', showActionButton: false,),
                      const SizedBox(height: TSizes.spaceBtwItems,),

                      TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set your delivery address', onTap:() => Get.to(() => UserAddressScreen()), ),
                      const TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and services and move to checkout'),
                      const TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed services and orders'), 
                      const TSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                      const TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                      const TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                      const TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                      /// App Settings
                      const SizedBox(height: TSizes.spaceBtwSections),
                      const TSectionHeading(title: 'App Settings', showActionButton: false),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),


                     TSettingsMenuTile(

                          icon: Iconsax.location,
                          title: 'Geolocation',
                          subTitle: 'Set recommendation based on location',
                          trailing: Switch(value: true, onChanged: (value) {}), ),

                          // TSettingsMenuTile

                      TSettingsMenuTile(
                          icon: Iconsax.security_user,
                          title: 'Safe Mode',
                          subTitle: 'Search result is safe for all ages',
                          trailing: Switch (value: true, onChanged: (value) {}), ), // TSettingsMenuTile

                      TSettingsMenuTile(
                          icon: Iconsax.image,
                          title: 'HD Image Quality',
                          subTitle: 'Set image quality to be seen',
                          trailing: Switch(value: false, onChanged: (value) {}), ),

                      const SizedBox(height: TSizes.spaceBtwSections,),

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
                      ),

                      const SizedBox(height: TSizes.spaceBtwSections*1,),
          


              ],
            ),)
          ],
        ),
      ),

    );
  }
}

