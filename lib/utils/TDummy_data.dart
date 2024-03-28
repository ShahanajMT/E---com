import 'package:tstore/Routes/routes.dart';
import 'package:tstore/features/shop/models/banner_model.dart';
import 'package:tstore/utils/constants/image_strings.dart';

class TDummyData {
  // Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.promoBanner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.productImage2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.productImage3, targetScreen: TRoutes.favourites, active: true),
  ];
}