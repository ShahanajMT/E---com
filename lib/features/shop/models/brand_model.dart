// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productCount,
  });

  //Empty Helper
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  // Convert Models to Json Structure so that you can store Data in FB
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductCount': productCount,
    };
  }

  // Map json oriented document snapshot from FB to UserModel

  // factory BrandModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     //! Map Json Record to the Model
  //     return BrandModel(
  //       id: document.id,
  //       name: data['Name'] ?? '',
  //       image: data['Image'] ?? '',
  //       productCount: data['ProductCount'] ?? '',
  //       isFeatured: data['isFeatured'] ?? false,
  //     );
  //   } else {
  //     return BrandModel.empty(); // Return an empty BrandModel instance
  //   }
  // }

  //00000
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      productCount: int.parse((data['ProductCount'] ?? 0).toString()),
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}
