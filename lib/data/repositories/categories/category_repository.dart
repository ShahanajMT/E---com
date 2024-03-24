import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:tstore/features/shop/models/category_model.dart';
import 'package:tstore/utils/exceptions/firebaseAuth_exception.dart';
import 'package:tstore/utils/exceptions/platfoem_exception.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //! variables
  final _db = FirebaseFirestore.instance;

  //! Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;

    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
    
  }


  //! Get Sub Categories

  //! Upload Categories to the Cloud Firestore
}