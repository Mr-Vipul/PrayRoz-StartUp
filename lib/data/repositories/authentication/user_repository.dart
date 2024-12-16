import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prayroz/data/repositories/authentication/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';


/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Something went wrong. Please try again';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      // throw TPlatformException(e.code).message;
      throw 'Something went wrong. Please try again';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on the user ID.

}

