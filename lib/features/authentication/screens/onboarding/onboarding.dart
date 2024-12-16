import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/features/authentication/screens/widgets/onbaording_dot_Naviagtion.dart';
import 'package:prayroz/features/authentication/screens/widgets/onboarding_NextButton.dart';
import 'package:prayroz/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:prayroz/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),

          // Skip Button
          const OnBoardSkip(),

          //
          const OnBoardingNavigation(),

          // Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
