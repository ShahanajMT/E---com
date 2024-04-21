import 'package:tstore/Routes/routes.dart';
import 'package:tstore/features/shop/models/banner_model.dart';
import 'package:tstore/features/shop/models/brand_model.dart';
import 'package:tstore/features/shop/models/product_attribute_models.dart';
import 'package:tstore/features/shop/models/product_model.dart';
import 'package:tstore/features/shop/models/product_variation_model.dart';
import 'package:tstore/utils/constants/image_strings.dart';

class TDummyData {
  // Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.promoBanner1,
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: TImages.productImage2,
        targetScreen: TRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: TImages.productImage3,
        targetScreen: TRoutes.favourites,
        active: true),
  ];

  //! ----- List Of All Products -------- !//
  static final List<ProductModel> products = [
    //----- Product 1 ------- //
    ProductModel(
      id: '001',
      stock: 15,
      sku: 'ABR4648',
      price: 135,
      isFeatured: false,
      title: 'Green Nike Sports Shoe',
      thumbnail: TImages.productImage1,
      brand: BrandModel(
          id: '1', name: 'Nike', image: TImages.apple_pay, productCount: 265),
      categoryId: '1',
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      description: 'Green Nike Sports Shoe',
      productType: 'Shoe',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 33,
          price: 135,
          salePrice: 120.4,
          image: TImages.productImage2,
          description: 'This is a Product description for Red Nike Shoes.',
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
      ],
    ),

    //----- Product 1 end ------- //

    ProductModel(
      id: '002',
      stock: 15,
      sku: 'ABR4648',
      price: 135,
      isFeatured: false,
      title: 'Green Nike Sports Shoe',
      thumbnail: TImages.productImage1,
      brand: BrandModel(
          id: '1', name: 'Nike', image: TImages.apple_pay, productCount: 265),
      categoryId: '1',
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      description: 'Green Nike Sports Shoe',
      productType: 'Shoe',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
       
      ],
    ),

    // -------------------------------------
    ProductModel(
      id: '003',
      stock: 15,
      sku: 'ABR4648',
      price: 135,
      isFeatured: false,
      title: 'Green Nike Sports Shoe',
      thumbnail: TImages.productImage1,
      brand: BrandModel(
          id: '1', name: 'Nike', image: TImages.apple_pay, productCount: 265),
      categoryId: '1',
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      description: 'Green Nike Sports Shoe',
      productType: 'Shoe',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 34,
          price: 134,
          salePrice: 122.36,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Shoes.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
       
      ],
    ),
  ];
}
