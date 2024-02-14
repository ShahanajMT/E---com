import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/features/shop/screens/ProductReviewScreen/product_review.dart';
import 'package:tstore/features/shop/screens/product_details/widgets/TBottomAddToCart.dart';
import 'package:tstore/features/shop/screens/product_details/widgets/TProductAttributes.dart';
import 'package:tstore/features/shop/screens/product_details/widgets/TProductMetaData.dart';
import 'package:tstore/features/shop/screens/product_details/widgets/TRating&Share.dart';
import 'package:tstore/utils/constants/sizes.dart';

import 'widgets/Tproduct_image_title.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Product Image Slider
            const TProductImageTitle(),

            //! Product Details Page
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // --- Rating & Share Button
                  const TRatingandShare(),

                  // --- Product Meta Data
                  const TproductMetaData(),

                  // ---- Attribute
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBwSections),

                  // ---- Checkout Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('CheckOut')),
                  ),
                  const SizedBox(height: TSizes.spaceBwSections),

                  // ---- Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBwItems),
                  const ReadMoreText(
                    'This is a Product description for red nike T - Shirt Half Sleave less waste .. There are more thing sthat can be added but i ...................................',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: TSizes.spaceBwSections),

                  // ---- Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews (199)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3, size: TSizes.lg,))
                    ],
                  ),
                  


                ],
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: const TBottomAddToCart(),
    );
  }
}
