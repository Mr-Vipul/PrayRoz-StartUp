import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/features/personalization/screens/profile/profile.dart';
import 'package:prayroz/utils/constants/colors.dart';
import 'package:prayroz/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required Future? Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: const Image(image: AssetImage(TImages.user, ), width: 50, height: 50,),
    title: Text('Vipul Goyal', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.White),),
    subtitle: Text('goyalvipul2002@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.White),),
    trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen()), icon: const Icon(Iconsax.edit, color: TColors.White,)));
  }
}
