import 'package:get/get.dart';
import 'package:tstore/Routes/routes.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/features/authentication/screens/onBoarding/onBoarding_page.dart';
import 'package:tstore/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:tstore/features/authentication/screens/signUp/signUp.dart';
import 'package:tstore/features/authentication/screens/signUp/verifyEmail.dart';
import 'package:tstore/features/personalisation/screens/address/address.dart';
import 'package:tstore/features/personalisation/screens/profile/profile.dart';
import 'package:tstore/features/personalisation/screens/settings/settings.dart';
import 'package:tstore/features/shop/screens/Home/home.dart';
import 'package:tstore/features/shop/screens/ProductReviewScreen/product_review.dart';
import 'package:tstore/features/shop/screens/cart/cart.dart';
import 'package:tstore/features/shop/screens/checkout/checkout.dart';
import 'package:tstore/features/shop/screens/order/order.dart';
import 'package:tstore/features/shop/screens/store/store.dart';
import 'package:tstore/features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const WishlistScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreens()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignUpPage()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LogInPage()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBording, page: () => const OnBoardingScreen()),
  ];
}