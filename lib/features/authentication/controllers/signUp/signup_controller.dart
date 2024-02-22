import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/networkconnection/network_manager.dart';
import 'package:tstore/utils/popups/full_screen_loader.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class SignupController extends GetxController {
  static SignupController get instaance => Get.find();

  //? Variables
  final fistName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //? SIGNUP
  Future<void> signUp () async {
    try {
      // start  loading 
      TFullScreenLoader.openLoadingDialog('We are processing your interface', TImages.animationIcon);

      // check Inetwork connetivity
      final isConnected = await NetworkManager.inastance.isConnected();
      if (!isConnected) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        //TFullScreenLoader.stopLoading();
        return;
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'on Snap', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }

}