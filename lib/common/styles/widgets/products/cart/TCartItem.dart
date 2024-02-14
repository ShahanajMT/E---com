import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_fn.dart';
import '../../images/T_RoundedImage.dart';
import '../../texts/productTitleText.dart';
import '../../texts/t_brandIconTextWithVerifiedIcon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // --- image
        TRoundImage(
          imageUrl: TImages.productImage2,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroudColor: THelperFunction.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBwItems),

        //---- Title, Price, Size
         Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                  title: 'Red Sports Shoe ',
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color  ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green  ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size  ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UK 08  ', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}