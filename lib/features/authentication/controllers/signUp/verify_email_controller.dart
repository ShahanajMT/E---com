import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/widgets/success_screen/success_screen.dart';
import 'package:tstore/data/repositories/authentication/authentication_repo.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/text_strings.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //! send Email Whenever Verify Screen Appears and set Timer for auto redirect

  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVeification();
    setTimerForAutoRedirect();
    //checkEmailCerificationStatus();
    super.onInit();
  }

  //! Send Email Verification Link
  sendEmailVeification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Send',
          message: 'Please check your inbox and verify email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }

  //! Time automatically redirect on Email Verification
  setTimerForAutoRedirect() async {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
              image: TImages.successfullyReisteredAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
            ),
          );
        }
      },
    );
  }

  //! Manually check if email verified
  checkEmailCerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
       Get.off(
            () => SuccessScreen(
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
              image: TImages.successfullyReisteredAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
            ),
          );
    }
  }
}
