

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/features/authentication/screens/onBoarding/onBoarding_page.dart';
import 'package:tstore/features/authentication/screens/signUp/verifyEmail.dart';
import 'package:tstore/navigation_bar_menu.dart';
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
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // if(kDebugMode) {
      //   print('=========== Get Storage Auth Repo =========');
      //   print(deviceStorage.read('IsFirstTime'));
      // }
      //? LocalStorage
      deviceStorage.writeIfNull('IsFirstTime', true);
      //? check if it is the first time launching app.
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(const LogInPage())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  //! -------- Email Password and SignUp --------- !//
  //[Email Authentication] -> signIn

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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
      throw 'Something went wrong. Please try again';
    }
  }

  //[Email Authentication] -> Register
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
      throw 'Something went wrong. Please try again';
    }
  }

  //[Email Authentication] -> Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
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

  //[Email Authentication] -> ReAuthenticate User

  //[Email Authentication] -> ForgetPassword
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  //! ------------------------ Social Media SignIn ------------------------- !//

  //[Google Authentication] -> Google
   Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentucation flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the req
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // once signed in, return the userCredential
      return await _auth.signInWithCredential(credentials);
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

  //[FB Authentication] -> Facebook

  //! -------------------------- SignOut ---------------- !//
  //[logoutUser] -> valid for any authentication
  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();

      Get.offAll(() => const LogInPage());
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
  //[Delete User] -> remove user auth and firebase account  
}
