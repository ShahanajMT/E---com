import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tstore/features/shop/models/brand_model.dart';
import 'package:tstore/features/shop/models/product_attribute_models.dart';
import 'package:tstore/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool isFeatured;
  BrandModel brand;
  String categoryId;
  List<String> images;
  String description;
  String productType;
  List<ProductAttributeModel> productAttributes;
  List<ProductVariationModel> productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    required this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured = false,
    required this.brand,
    required this.categoryId,
    required this.images,
    required this.description,
    required this.productType,
    required this.productAttributes,
    required this.productVariations,
  });

  /// Creates an empty ProductModel instance.
  static ProductModel empty() => ProductModel(
        id: '',
        stock: 0,
        sku: '',
        price: 0,
        title: '',
        thumbnail: '',
        productType: '',
        brand: BrandModel.empty(), // Assuming you have an empty constructor in BrandModel
        categoryId: '',
        images: [],
        description: '',
        productAttributes: [],
        productVariations: [],
      );

  /// Converts the product data to JSON format.
  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Image': images,
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttribute': productAttributes.map((e) => e.toJson()).toList(),
      'ProductVariations': productVariations.map((e) => e.toJson()).toList(),
    };
  }

  // Map json oriented document snapshot from FB to UserModel
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
   final data = document.data()!;
   return ProductModel(
    id: document.id,
    sku: data['SKU'],
    title: data['Title'],
    stock: data['Stock'] ?? 0,
    isFeatured: data['IsFeatured'] ?? false,
    price: double.parse((data['Price'] ?? 0.0).toString()),
    salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
    thumbnail: data['Thumbnail'] ?? '',
    categoryId: data['CategoryId'] ?? '',
    description: data['Description'] ?? '',
    productType: data['ProductType'] ?? '',
    brand: BrandModel.fromJson(data['Brand']),
    images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
    productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
   );
  }
}
