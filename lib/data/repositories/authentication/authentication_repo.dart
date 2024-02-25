import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/features/authentication/screens/onBoarding/onBoarding_page.dart';
import 'package:tstore/features/authentication/screens/signUp/verifyEmail.dart';
import 'package:tstore/navigation_bar_menu.dart';
import 'package:tstore/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:tstore/utils/exceptions/firebase_exception.dart';
import 'package:tstore/utils/exceptions/format_exceptions.dart';
import 'package:tstore/utils/exceptions/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // fn to show relavent
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else {
        //? LocalStorage

    if (kDebugMode) {
      print('=========== Get Storage Auth Repo =========');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(const LogInPage())
        : Get.offAll(const OnBoardingScreen());
    }

    
  }

  //! -------- Email Password and SignUp --------- !//
  // [Email Authentication] -> signIn

  // [Email Authentication] -> Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Sometime went wrong. Please try again';
    }
  }

  // [Email Verification] -> Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw TFormatException();
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [ReAuthenticate] -> ReAuthenticate

  // [Email Authentication] -> ForgetPassword

  //! ---------------------------- Socail SignIn ------------------------ !//

  // [Google Authenticate] -> GoogleAuthenticate
  // [FaceBook Authenticate] -> FacebookAuthenticate


  //! ---------------------------- ./end logOut/Delete ------------------- !//
  // [Logout User] -> valid for any authentication
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LogInPage());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw TFormatException();
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [DeleteUser] -> Remove user auth and FireStore account

}
