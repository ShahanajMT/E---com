import 'package:flutter/material.dart';

import '../custome_shapes/containers/TRoundedContainer.dart';
import '../images/T_CircularImage.dart';
import '../texts/t_brandIconTextWithVerifiedIcon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_fn.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    Key? key,
    required this.showBorder,
    this.onTap,
  }) : super(key: key);

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroudColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                backgroudColor: Colors.transparent,
                image: TImages.clothIcon,
                overlayColor:
                   darkMode
                        ? TColors.white
                        : TColors.black,
              ),
            ),
            const SizedBox(
                width: TSizes.spaceBwItems / 2),
            // -- text
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const TBrandTitleTextWithVerifiedIcon(
                      title: 'Nike',
                      brandTextSizes:
                          TextSizes.large),
                  Text(
                    '255 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}