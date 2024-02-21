import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/features/authentication/screens/onBoarding/onBoarding_page.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();


  // called from main.dart on app launch

  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // fn to show relavent 
  screenRedirect() async{
    //? LocalStorage

    if(kDebugMode) {
      print('=========== Get Storage Auth Repo =========');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(const LogInPage()) : Get.offAll(const OnBoardingScreen());

  }

  //! -------- Email Password and SignUp --------- !//
  //[Email Authentication] -> signIn
}