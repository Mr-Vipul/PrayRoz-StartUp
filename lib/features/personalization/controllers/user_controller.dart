import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prayroz/data/repositories/authentication/user_repository.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/authentication/user_model.dart';


class UserController extends GetxController {
  static UserController get instance => Get.find();
  
  final userRepository = Get.put(UserRepository());
  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Assuming you want to save the user data to a model or database
       final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length >1?nameParts.sublist(1).join(' '):' ',
          username: username,
          email: userCredentials.user!.email ?? '',
         phoneNumber: userCredentials.user!.phoneNumber ?? '',
         profilePicture: userCredentials.user!.photoURL ?? '',
        );
       await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

}
