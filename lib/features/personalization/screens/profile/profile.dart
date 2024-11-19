import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/common/widgets/appbar/appbar.dart';
import 'package:prayroz/common/widgets/images/t_circular_images.dart';
import 'package:prayroz/common/widgets/texts/section_heading.dart';
import 'package:prayroz/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true,title: Text('Profile'),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [

            // Profile picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const TCircularImage(image: TImages.user, width: 100, height: 100,),
                  TextButton(onPressed: (){}, child: const Text('Change your Profile Picture'),
                  )
              
                ],
              ),
            ),

            //Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Heading Profile Info
            const TSectionHeading(title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Heading personal info
            TProfileMenu(title: 'Name', value: 'Rahul Singh', onPressed: () {}),
            TProfileMenu(title: 'Username', value: 'Rahul_Sikarwar', onPressed: () {}),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal Info
            const TSectionHeading (title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(title: 'User ID', value: '04519011721', icon: Iconsax.copy, onPressed: () {}),
            TProfileMenu(title: 'E-mail', value: 'rahul2002@gmail.com', onPressed: () {}),
            TProfileMenu(title: 'Phone No.', value: '+91-9625564381', onPressed: () {}),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
            TProfileMenu(title: 'Date of Birth', value: '01 Oct, 2000', onPressed: () {}),

            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),

            Center(
              child: TextButton(onPressed: (){}, child: const Text('Close Account', style: TextStyle(color: Colors.red),)),
            )

          ],
        ),
        ),
      ),
    );
  }
}
