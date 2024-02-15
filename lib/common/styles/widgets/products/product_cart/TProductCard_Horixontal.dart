import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/icons/TCircularIcon.dart';
import 'package:tstore/common/styles/widgets/images/T_RoundedImage.dart';
import 'package:tstore/common/styles/widgets/texts/productPriceText.dart';
import 'package:tstore/common/styles/widgets/texts/productTitleText.dart';
import 'package:tstore/common/styles/widgets/texts/t_brandIconTextWithVerifiedIcon.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageradius),
        color: darkMode ? TColors.darkergrey : TColors.white,
      ),
      child: Row(
        children: [
          //! Thumnail
          TRoundedContainer(
            height: 120,
            //width: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroudColor: darkMode ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                //!-- Thumbnail Image
                const SizedBox(
                  height: 120,
                  //width: 120,
                  child: TRoundImage(
                    fit: BoxFit.cover,
                    imageUrl: TImages.productImage2,
                    applayImageRadius: true,
                  ),
                ),

                //! sale offer
                Positioned(
                  top: 7,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroudColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '23%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                //! favIcon
                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    width: 40,
                    height: 38,
                    icon: Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            //showBorder: true,
          ),

          //! Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                          title: 'Nike Half Sleave T- Shirt', smallSize: true),
                      SizedBox(height: TSizes.spaceBwItems / 2),
                      TBrandTitleTextWithVerifiedIcon(title: 'Nike')
                    ],
                  ),

                 // const SizedBox(height: TSizes.spaceBwSections,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // pricing
                      const Flexible(child: TProductPriceText(price: '23.0')),

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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
