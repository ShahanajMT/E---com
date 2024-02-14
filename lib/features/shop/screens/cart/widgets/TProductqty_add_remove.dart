import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../common/styles/widgets/icons/TCircularIcon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductQtyWithAddAndRemove extends StatelessWidget {
  const TProductQtyWithAddAndRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunction.isDarkMode(context)
              ? TColors.light
              : TColors.black,
          backgroudColor: THelperFunction.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.grey,
        ),
        const SizedBox(width: TSizes.spaceBwItems),
        Text('3',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBwItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunction.isDarkMode(context)
              ? TColors.light
              : TColors.black,
          backgroudColor: THelperFunction.isDarkMode(context)
              ? TColors.primary
              : TColors.grey,
        ),
      ],
    );
  }
}