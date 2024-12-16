import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/common/widgets/loaders/loaders.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/popups/full_screen_loader.dart';

import '../../../../common/widgets/loaders/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final TextEditingController email = TextEditingController(); // Controller for email input
  final TextEditingController firstName = TextEditingController(); // Controller for first name input
  final TextEditingController lastName = TextEditingController(); // Controller for last name input
  final TextEditingController username = TextEditingController(); // Controller for username input
  final TextEditingController password = TextEditingController(); // Controller for password input
  final TextEditingController phoneNumber = TextEditingController(); // Controller for phone number input
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for validation

  /// SIGNUP FUNCTION
  Future<void> signup() async {
    try {
      /// Start Loading (Optional: Show a loader if needed)
      TFullScreenLoader.openLoadingDialog('We Are processing your details', TImages.delivery);


      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      /// Form Validation
      if(!signupFormKey.currentState!.validate()) return;

      

      /// Privacy Policy Check (Example: Add your own logic here)
      // bool acceptedPrivacyPolicy = _checkPrivacyPolicy();
      // if (!acceptedPrivacyPolicy) {
      //   Get.snackbar("Error", "Please accept the privacy policy",
      //       snackPosition: SnackPosition.BOTTOM);
      //   return;
      // }

      /// Perform Signup (Example: Replace with your actual signup logic)
      // final user = {
      //   "email": email.text.trim(),
      //   "firstName": firstName.text.trim(),
      //   "lastName": lastName.text.trim(),
      //   "username": username.text.trim(),
      //   "password": password.text.trim(),
      //   "phoneNumber": phoneNumber.text.trim(),
      // };

      // Simulate a signup API call


      // Success Notification

      // Redirect to another screen
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      TFullScreenLoader.stopLoading();
    }
  }
}
