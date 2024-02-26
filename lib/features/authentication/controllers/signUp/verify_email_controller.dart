import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/widgets/success_screen/success_screen.dart';
import 'package:tstore/data/repositories/authentication/authentication_repo.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/text_strings.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class VerifyEmailContoller extends GetxController {
  static VerifyEmailContoller get instace => Get.find();

  //! send Email Whenever Verify Screen Appears and set time for auto redirect
  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerForAutoRedirect();
    
    super.onInit();
  }

  //! send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Send',
          message: 'Please check your inbox and veridy email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //! Timer to automatically redirect

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.offAll(
            () => SuccessScreen(
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
              image: TImages.amazon_pay,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
            ),
          );
        }
      },
    );
  }

  //! manually check if email verified.

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.offAll(
        () => SuccessScreen(
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          image: TImages.amazon_pay,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
        ),
      );
    }
  }
}
