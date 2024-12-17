import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:prayroz/common/widgets/success_screen/success_screen.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'dart:async';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  var isEmailVerified = false.obs;

  /// Triggered when the controller is initialized
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email Sent", message: 'Please Check your inbox and verify your email.');
    }catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
}

  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1),(timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(()=> SuccessScreen(
          image: TImages.user,
          title: TTexts.yourAccountCreatedSubTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressesed:()=> AuthenticationRepository.instance.screenRedirect(),
        ),
        );
      }
    });
  }

/// Manually Check if Email Verified

checkEmailVerificationStatus() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null && currentUser.emailVerified) {
    Get.off( () => SuccessScreen(
        image: TImages.delivery,
        title: TTexts.yourAccountCreatedTitles,
        subtitle: TTexts.yourAccountCreatedSubTitle,
        onPressesed: () => AuthenticationRepository.instance.screenRedirect(),
      ),
    );
  }
}
}
