// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:tstore/common/styles/shadows.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/icons/TCircularIcon.dart';
import 'package:tstore/common/styles/widgets/images/T_RoundedImage.dart';
import 'package:tstore/common/styles/widgets/texts/productPriceText.dart';
import 'package:tstore/common/styles/widgets/texts/t_brandIconTextWithVerifiedIcon.dart';
import 'package:tstore/utils/constants/colors.dart';

import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../texts/productTitleText.dart';


class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return InkWell(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            TShadowStyle.verticalProductShadow,
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageradius),
          color: darkMode ? TColors.darkergrey : TColors.white,
        ),
        child: Column(
          children: [
            //! ---- Thumnail, WishlistButton, DiscountTag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.md),
              backgroudColor: darkMode ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //! Thumbnail Image
                  const TRoundImage(
                      imageUrl: TImages.productImage1, applayImageRadius: true, height: 180, fit: BoxFit.cover),
                  //! Sale Tag
                  Positioned(
                    top: 7,
                    left: 5,

                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroudColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  //! FavIconButton
                  const Positioned(
                    top: 5,
                    right: 4,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),

            //const SizedBox(height: 3,),

            //! --- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleText(
                      title: 'Canvas Angle Shoes', smallSize: true),
                  const SizedBox(height: TSizes.spaceBwItems / 2),
                  const TBrandTitleTextWithVerifiedIcon(title: 'Canvas'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ---- Price ---- //
                      const TProductPriceText(
                        price: '35.5',
                      ),

                      // ---- Add to Card Button --- //
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    TSizes.productImageradius))),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(Iconsax.add, color: TColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


