import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user_models.dart';
import '../../../utils/exceptions/firebaseAuth_exception.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platfoem_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instace => Get.find();



  final FirebaseFirestore _db = FirebaseFirestore.instance;


  //! Fn t save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async{
     try {
      await _db.collection("User").doc(user.id).set(user.toJson());
    
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

  //! Fn to fetch user details based on UserId

  //!

  //!
}