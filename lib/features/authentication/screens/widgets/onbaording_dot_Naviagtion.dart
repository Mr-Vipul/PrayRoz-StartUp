import 'package:flutter/material.dart';
import 'package:prayroz/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:prayroz/utils/constants/colors.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/device/device_utility.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(context) + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3,
            effect: const ExpandingDotsEffect(
                activeDotColor: TColors.dark, dotHeight: 6)));
  }
}
