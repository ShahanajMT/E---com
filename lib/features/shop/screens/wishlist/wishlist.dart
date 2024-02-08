import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/icons/TCircularIcon.dart';
import 'package:tstore/common/styles/widgets/layout/TGridlayout.dart';
import 'package:tstore/common/styles/widgets/products/product_cart/TProductCart_vertical.dart';
import 'package:tstore/features/shop/screens/Home/home.dart';
import 'package:tstore/utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(
              () => const HomeScreen(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 6,
                itemBuilder: (_, index) {
                  return const TProductCardVertical();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
