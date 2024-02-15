import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/features/shop/screens/cart/widgets/cartItems.dart';
import 'package:tstore/features/shop/screens/checkout/checkout.dart';
import 'package:tstore/utils/constants/sizes.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        // ! Items in Cart
        child: ListOfCartItems()
      ),

      //! checkOut Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckOutScreen()), style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))) ,child: const Text('CheckOut \$234')),
      ),
    );
  }
}


