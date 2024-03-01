import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tstore/data/repositories/user/user_repo.dart';
import 'package:tstore/features/authentication/models/user_models.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class UserController extends GetxController {
  static UserController get instance => UserController();

  final userRepository = Get.put(UserRepository());

  //! save UserRecord from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // convert name to First and Last name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final userName =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // map Data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: userName,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }


    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not found!',
          message:
              'Something went wrong while saving your information. You can re save your data in your profile');
    }
  }
}
