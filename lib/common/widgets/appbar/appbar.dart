import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/utils/device/device_utility.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({Key? key, 
  this.title, 
  this.showBackArrow = false, 
  this.leadingIcon, 
  this.actions, 
  this.leadingOnPressed}) : super(key: key);


  final Widget? title ;
  final bool showBackArrow ;
  final IconData? leadingIcon ;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
    child: AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow
              ? IconButton(onPressed:() => Get.back(), icon:  Icon(Iconsax.arrow_left, color: dark ? TColors.white: TColors.dark))
              : leadingIcon !=null ? IconButton(onPressed: leadingOnPressed, icon:Icon(leadingIcon)) : null,
      title: title,
      actions: actions,
      ),
    );
  }
  @override
    // TODO: implement ==
    Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
