import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayroz/features/personalization/controllers/user_controller.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/loaders/network_manager.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }


  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.user);

      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if "Remember Me" is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect to the appropriate screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Stop loader on error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Login Failed', message: e.toString());
    }
  }


  ///Google Sign In
  // Future<void> googleSignIn() async{
  //   try{
  //     TFullScreenLoader.openLoadingDialog('Logging You in...', TImages.loading);
  //
  //     // final isConnected = await NetworkManager.instance.isConnected();
  //     // if (!isConnected) {
  //     //   TFullScreenLoader.stopLoading();
  //     //   return;
  //     // }
  //
  //     //Google Auth
  //     final userCredentials = AuthenticationRepository.instance.signInWithGoogle();
  //
  //     ///SAVE USER
  //     await userController.saveUserRecord(userCredentials);
  //     TFullScreenLoader.stopLoading();
  //     AuthenticationRepository.instance.screenRedirect();
  //
  //   }catch(e){
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }

  /// Google Sign In
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging You in...', TImages.loading);

      // Check if the user is connected to the internet (if needed)
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      // Google Auth
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle(); // Use await here

      if (userCredentials != null) {
        /// SAVE USER
        await userController.saveUserRecord(userCredentials); // Pass the result directly

        // Stop the loading dialog
        TFullScreenLoader.stopLoading();

        // Redirect to the appropriate screen
        AuthenticationRepository.instance.screenRedirect();
      } else {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Sign In Failed', message: 'Google Sign In failed.');
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


}
