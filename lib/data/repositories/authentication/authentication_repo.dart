import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/features/authentication/screens/onBoarding/onBoarding_page.dart';
import 'package:tstore/utils/exceptions/firebaseAuth_exception.dart';
import 'package:tstore/utils/exceptions/firebase_exception.dart';
import 'package:tstore/utils/exceptions/format_exception.dart';
import 'package:tstore/utils/exceptions/platfoem_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //! variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


  //! called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //! fn to show relavent 
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

  //[Email Authentication] -> Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {

    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
    

  }
}