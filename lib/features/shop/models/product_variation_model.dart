// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tstore/features/shop/models/product_attribute_models.dart';

class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  // create a empty Fn for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  // json Format
  toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  // Map jSon oriented document snapshot from firebase to UserModel
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
        id: data['Id'] ?? '',
        sku: data['SKU'] ?? '',
        image: data['Image'] ?? '',
        description: data['Description'] ?? '',
        price: double.parse((data['Price'] ?? 0.0).toString()), 
        salePrice:  double.parse((data['SalePrice'] ?? 0.0).toString()),
        stock: data['Stock'] ?? 0.0,
        attributeValues: Map<String, String>.from(data['AttributeValues']));
  }
}
