import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prayroz/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:prayroz/features/authentication/screens/login/login.dart';
import 'package:prayroz/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:prayroz/features/authentication/screens/signup/verify_email.dart';
import 'package:prayroz/navigation_menu.dart';


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
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll( () =>  NavigationMenu());
      }else{
        Get.offAll( () => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
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
  }
  ///Login
    Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
        try {
          return await _auth.signInWithEmailAndPassword(email: email, password: password);
        } on FirebaseAuthException catch (e) {
          throw Exception("Something went wrong. Please try again.");
        } on FirebaseException catch (e) {
          throw Exception("Something went wrong. Please try again.");
        } on FormatException catch(_) {
          throw Exception("Something went wrong. Please try again.");
        } on PlatformException catch (e) {
          throw Exception("Something went wrong. Please try again.");
        } catch (e) {
          throw Exception("Something went wrong. Please try again.");
        }
      }


    ///Register
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

    ///Mail Verification
    Future<void> sendEmailVerification() async{
      try {
        await _auth.currentUser?.sendEmailVerification();
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

    ///logout
    Future<void> logout() async{
      try {
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
        Get.offAll(()=> const LoginScreen());
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

    ///GOOGLE SING IN
  Future<UserCredential?> signInWithGoogle() async{
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw Exception("Something went wrong. Please try again.");
    } on FirebaseException catch (e) {
      throw Exception("Something went wrong. Please try again.");
    } on FormatException catch(_) {
      throw Exception("Something went wrong. Please try again.");
    } on PlatformException catch (e) {
      throw Exception("Something went wrong. Please try again.");
    } catch (e) {
      if(kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }


}

