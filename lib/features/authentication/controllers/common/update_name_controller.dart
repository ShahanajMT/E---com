import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/data/repositories/user/user_repo.dart';
import 'package:tstore/features/personalisation/controllers/user_controller.dart';
import 'package:tstore/features/personalisation/screens/profile/profile.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/networkconnection/network_manager.dart';
import 'package:tstore/utils/popups/full_screen_loader.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //! init userData when HomeScreen Apperars.
  @override
  void onInit() {
    // TODO: implement onInit
    initializeName();
    super.onInit();
  }

  //! Fetch userRecord
  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    
    try {
      //! startLoading
      TFullScreenLoader.openLoadingDialog('We are updating your information', TImages.apple_pay);


      //! check Internet Conectivity
      final isConnected = await NetworkManager.inastance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //! formValidation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //! update User FirstName and LastName in Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName' : firstName.text.trim(),
        'LastName' : lastName.text.trim(),
      };
      await userRepository.updateSingleFeild(name);


      // ! update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //! RemoveLoader
      TFullScreenLoader.stopLoading();

      //! show Success message
      TLoaders.successSnackBar(title: 'Congragulations!', message: 'Your name has been updated!');

      //! Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      
    }
  }
}