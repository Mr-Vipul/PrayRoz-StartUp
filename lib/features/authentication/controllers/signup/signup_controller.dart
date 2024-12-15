import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
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
      // Start Loading (Optional: Show a loader if needed)
      Get.snackbar("Loading", "Please wait...", snackPosition: SnackPosition.BOTTOM);

      // Check Internet Connectivity
      bool isConnected = await _checkInternetConnectivity();
      if (!isConnected) {
        Get.snackbar("Error", "No internet connection", snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        Get.snackbar("Error", "Please correct the errors in the form",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Privacy Policy Check (Example: Add your own logic here)
      bool acceptedPrivacyPolicy = _checkPrivacyPolicy();
      if (!acceptedPrivacyPolicy) {
        Get.snackbar("Error", "Please accept the privacy policy",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Perform Signup (Example: Replace with your actual signup logic)
      final user = {
        "email": email.text.trim(),
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "username": username.text.trim(),
        "password": password.text.trim(),
        "phoneNumber": phoneNumber.text.trim(),
      };

      // Simulate a signup API call
      await Future.delayed(const Duration(seconds: 2)); // Simulating a network call
      debugPrint("User signed up successfully: $user");

      // Success Notification
      Get.snackbar("Success", "Signup successful!", snackPosition: SnackPosition.BOTTOM);

      // Redirect to another screen
      Get.offAllNamed("/login"); // Replace with your desired route
    } catch (e) {
      // Handle Errors
      debugPrint("Signup error: $e");
      Get.snackbar("Error", "An error occurred during signup: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// CHECK INTERNET CONNECTIVITY (Simulated for example purposes)
  Future<bool> _checkInternetConnectivity() async {
    // Replace this with a real connectivity check using a library like `connectivity_plus`
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay
    return true; // Assume connected for now
  }

  /// PRIVACY POLICY CHECK (Placeholder logic)
  bool _checkPrivacyPolicy() {
    // Replace with your actual privacy policy check logic
    return true; // Assume accepted for now
  }

  @override
  void dispose() {
    // Dispose controllers to free memory
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    password.dispose();
    phoneNumber.dispose();
    super.dispose();
  }
}
