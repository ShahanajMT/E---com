import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tstore/data/repositories/authentication/authentication_repo.dart';

import '../../../features/authentication/models/user_models.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platfoem_exception.dart';

class UserRepository extends GetxController {

  static UserRepository get instance => Get.find();



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

  //! Fn to fetch user details based on UserId (CRUD |)
  Future<UserModel> fetchUserDetails() async {
     try {
      final documentSnapshot = await _db.collection("User").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    
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

  //! Fn to update user data in firestore

  Future<void> updateUserDetails(UserModel updateUser) async{
     try {
      await _db.collection("User").doc(updateUser.id).update(updateUser.toJson());
    
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

  //! Update any field in specific user collection

  Future<void> updateSingleFeild(Map<String, dynamic> json) async{
     try {
      await _db.collection("User").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    
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

  //! Fn to remove user data in firestore

   Future<void> removeUserRecords(String userId) async{
     try {
      await _db.collection("User").doc(userId).delete();
    
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