import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tstore/data/repositories/authentication/authentication_repo.dart';
import 'package:tstore/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/networkconnection/network_manager.dart';
import 'package:tstore/utils/popups/full_screen_loader.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  // send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.amazon_pay);

      // check Internet Connectivity
      final isConnected = await NetworkManager.inastance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // remove Loader
      TFullScreenLoader.stopLoading();

      // show Success 
      TLoaders.successSnackBar(title: 'Email Send', message: 'Email link send to Reset Password');


      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()),);

    } catch (e) {
      // remove the Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh  Snap!', message: e.toString());
    }
  }


  resendPasswordResetEmail(String email) async {
    try {
      // start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.amazon_pay);

      // check Internet Connectivity
      final isConnected = await NetworkManager.inastance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove Loader
      TFullScreenLoader.stopLoading();

      // show Success 
      TLoaders.successSnackBar(title: 'Email Send', message: 'Email link send to Reset Password');


     

    } catch (e) {
      // remove the Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh  Snap!', message: e.toString());
    }
  }
}