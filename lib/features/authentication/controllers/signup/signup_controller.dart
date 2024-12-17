import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/common/widgets/loaders/loaders.dart';
import 'package:prayroz/data/repositories/authentication/authentication_repository.dart';
import 'package:prayroz/data/repositories/authentication/user_repository.dart';
import 'package:prayroz/features/authentication/screens/signup/verify_email.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/popups/full_screen_loader.dart';
import '../../../../common/widgets/loaders/network_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../data/repositories/authentication/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final  email = TextEditingController(); // Controller for email input
  final  firstName = TextEditingController(); // Controller for first name input
  final  lastName = TextEditingController(); // Controller for last name input
  final  username = TextEditingController(); // Controller for username input
  final  password = TextEditingController(); // Controller for password input
  final  phoneNumber = TextEditingController(); // Controller for phone number input
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for validation

  /// SIGNUP FUNCTION
  void signup() async {
    try {
      /// Start Loading (Optional: Show a loader if needed)
      TFullScreenLoader.openLoadingDialog('We Are processing your details', TImages.delivery);

      /// Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      //
      // if(!isConnected){
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      /// Form Validation
      if(!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy Check (Example: Add your own logic here)
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to crate account, you must have to read and accept the Privacy Policy & terms of Use');
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Perform Signup (Example: Replace with your actual signup logic)
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(),password.text.trim());
      final newUser = UserModel(
          id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      ///Remove Loader
      TFullScreenLoader.stopLoading();

      ///Show Success
      TLoaders.successSnackBar(title: 'Congratulations',message:"Your account has been created! Verify email to continue");

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
