import 'package:flutter/material.dart';
import 'package:prayroz/utils/device/device_utility.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart'; // Replace with the actual path to your helper functions
import 'package:prayroz/utils/constants/colors.dart'; // Replace with the actual path to your constants
// Replace with the actual path to your device utility constants

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the background color to tabs, you need to wrap them in a Material widget.
  /// To achieve that, we use `PreferredSizeWidget`, which is why we created this custom class.
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return Material(
      color: isDarkMode ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: isDarkMode ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ), // TabBar
    ); // Material
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
