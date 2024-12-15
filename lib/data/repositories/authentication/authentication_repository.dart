import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayroz/features/authentication/screens/login/login.dart';
import 'package:prayroz/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Local Storage Instance
  final GetStorage deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove(); // Remove the splash screen
    screenRedirect(); // Redirect to the appropriate screen
  }

  /// Function to Show Relevant Screen
  void screenRedirect() async {

    if(kDebugMode){
      print('======Get Storage Auth Repo=========');
      print(deviceStorage.read('IsFirsTime'));
    }
    // Check if this is the first launch
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ?Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    // Navigate to the relevant screen


/// Additional authentication methods (e.g., email & password sign-in) can go here
}
