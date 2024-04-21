import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tstore/data/services/TFirebaseStorageService.dart';
import 'package:tstore/utils/exceptions/firebase_exception.dart';
import 'package:tstore/utils/exceptions/platfoem_exception.dart';

import '../../../features/shop/models/product_model.dart';

enum ProductType {
  single,
  variable,
}

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // FB instance for DB interactions
  final _db = FirebaseFirestore.instance;

  // Get Limitted Feature Products.
  Future<List<ProductModel>> getFeaturedProducts() async {
  try {
    final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
    return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

  // Upload Dummy data to Cloud FS

  Future<void> uploadDummyData(List<ProductModel> prosucts) async {
    try {
      // upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());

      // loop throuht each product
      for (var product in prosucts) {
        // Get image data link from local accets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL.
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumnail attribute
        product.thumbnail = url;

        // Product list of images.

        if (product.images.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images) {
            // Get image data link from local assets.
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL.
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // Assign URL to Product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images.clear();
          product.images.addAll(imagesUrl);
        }

        // Upload Variation Image.
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations) {
            // Get Image Data Link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload Image and gets its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // Assign URL to variation.image ttribute
            variation.image = url;
          }
        }
        // Store Product in FS
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
