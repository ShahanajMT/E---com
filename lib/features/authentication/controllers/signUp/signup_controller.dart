import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/data/repositories/authentication/authentication_repo.dart';
import 'package:tstore/data/repositories/user/user_repo.dart';
import 'package:tstore/features/authentication/models/user_models.dart';
import 'package:tstore/features/authentication/screens/signUp/verifyEmail.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/networkconnection/network_manager.dart';
import 'package:tstore/utils/popups/full_screen_loader.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class SignupController extends GetxController {
  static SignupController get instaance => Get.find();

  //? Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final fistName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //? SIGNUP
  void signUp() async {
    try {
      //! start  loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your interface', TImages.animationIcon);

      //! check Inetwork connetivity
      final isConnected = await NetworkManager.inastance.isConnected();
      if (!isConnected) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      //! form validation
      if (!signupFormKey.currentState!.validate()) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      //! privacyPolicy
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms Of Use');
        return;
      }

      //! Register user in Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //! Save Authenticated User data in Firebase Firestore.

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: fistName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );


      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //! remove loader
      TFullScreenLoader.stopLoading();

      //! Show Success Message.
      TLoaders.successSnackBar(title: 'Congratulations!', message: 'Your account has been created!. Verify email to continue');

      //! Move to verify email screen.

      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //! show Some Generic error to the user.
      TLoaders.errorSnackBar(title: 'on Snap', message: e.toString());
    } finally {
      //! remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
