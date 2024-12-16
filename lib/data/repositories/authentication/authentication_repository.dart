import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayroz/features/authentication/screens/login/login.dart';
import 'package:prayroz/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Local Storage Instance
  final GetStorage deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove(); // Remove the splash screen
    screenRedirect(); // Redirect to the appropriate screen
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    if (kDebugMode) {
      print('======Get Storage Auth Repo=========');
      print(deviceStorage.read('IsFirsTime'));
    }
    // Check if this is the first launch
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ?
    Get.offAll(() => const LoginScreen()) :
    Get.offAll(const OnBoardingScreen());
  }

    Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
      try {
        return await _auth.createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        // throw TFirebaseAuthException(e.code).message;
        throw Exception("Something went wrong. Please try again.");
      } on FirebaseException catch (e) {
        // throw TFirebaseAuthException(e.code).message;
        throw Exception("Something went wrong. Please try again.");
      } on FormatException catch(_) {
        // throw const TFormatException();
        throw Exception("Something went wrong. Please try again.");
      } on PlatformException catch (e) {
        // throw TPlatformException(e.code).message;
        throw Exception("Something went wrong. Please try again.");
      } catch (e) {
        throw Exception("Something went wrong. Please try again.");
      }
    }
  }

