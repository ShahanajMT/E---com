import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tstore/features/shop/models/banner_model.dart';
import 'package:tstore/utils/exceptions/format_exception.dart';

import '../../../utils/exceptions/firebaseAuth_exception.dart';
import '../../../utils/exceptions/platfoem_exception.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // get all order related to current user.

  Future<List<BannerModel>> fetchBanners () async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload Banner to the Cloud FireStore.

}