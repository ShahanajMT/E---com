import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/images/T_CircularImage.dart';
import 'package:tstore/common/styles/widgets/texts/productPriceText.dart';
import 'package:tstore/common/styles/widgets/texts/productTitleText.dart';
import 'package:tstore/common/styles/widgets/texts/t_brandIconTextWithVerifiedIcon.dart';
import 'package:tstore/utils/constants/enums.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TproductMetaData extends StatelessWidget {
  const TproductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---- Price and Sale Price
        Row(
          children: [
            // --- sale tag
            TRoundedContainer(
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
            const SizedBox(width: TSizes.spaceBwItems),
            // ---- price tag
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBwItems),
            const TProductPriceText(price: '120', isLarge: true),
            const SizedBox(height: TSizes.spaceBwItems / 1.5),
          ],
        ),

        // --- Title
        const ProductTitleText(title: 'Nike Sports T-Shirt'),
        const SizedBox(height: TSizes.spaceBwItems / 1.5),

        // ----Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Status :', smallSize: true,),
            const SizedBox(height: TSizes.spaceBwItems),
            Text(
              '  In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBwItems / 1.5),

        // ---- Brand
        Row(
          children: [
            TCircularImage(image: TImages.shoesIcon, height: 32, width: 32, overlayColor: darkMode ? TColors.white : TColors.black),
            

            const TBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.medium,)
          ],
        )
      ],
    );
  }
}
