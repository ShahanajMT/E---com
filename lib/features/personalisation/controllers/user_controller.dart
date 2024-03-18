import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/data/repositories/authentication/authentication_repo.dart';
import 'package:tstore/data/repositories/user/user_repo.dart';
import 'package:tstore/features/authentication/models/user_models.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/features/personalisation/screens/profile/Widgets/re_auth_user.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/networkconnection/network_manager.dart';
import 'package:tstore/utils/popups/full_screen_loader.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //! fetch userRecord
  Future<void> fetchUserRecord() async {
    try {
      print('Fetching user details...');
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      print('User details fetched: $user');

      // Update user observable with fetched user data
      this.user(user);
      //this.user.value = user;
    } catch (e) {
      print('Error fetching user details: $e');
      // Handle error appropriately, e.g., showing an error message
      user(UserModel.empty());
    } finally {
      // Set profile loading state back to false
      profileLoading.value = false;
      print('Profile loading state set to false...');
    }
  }

// Future<void> fetchUserRecord() async {
//   try {
//     print('Fetching user details...');
//     profileLoading.value = true;
//     final user = await userRepository.fetchUserDetails(); // Use userRepository instead of UserRepository.instance
//     print('User details fetched: $user');

//     // Update user observable with fetched user data
//     if (user != null) {
//       this.user.value = user;
//     } else {
//       throw Exception('User data is null');
//     }
//   } catch (e) {
//     print('Error fetching user details: $e');
//     // Handle error appropriately, e.g., showing an error message
//     user(UserModel.empty());
//   } finally {
//     // Set profile loading state back to false
//     profileLoading.value = false;
//     print('Profile loading state set to false...');
//   }
// }

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

  //! Delete Account warning
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.sm),
      title: 'Delete Account',
      middleText: 'Are you sure! you want to delete your account permemently!',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.redAccent), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        onPressed: () async => deleteUserAccount(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  //! Delete User Account
  void deleteUserAccount () async{
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.apple_pay);

      //! first re_auth user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      
      if (provider.isNotEmpty) {
        //! re verify auth email
        if (provider == 'google.com')  {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LogInPage());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }

          
        
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //! ReAuthenticate Email and Password
  Future<void> reAuthenticateEmailAndPasswordUser () async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.amazon_pay);

      //! check Internet
      final isConnected = await NetworkManager.inastance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //! 
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LogInPage());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
