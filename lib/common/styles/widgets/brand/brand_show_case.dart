import 'package:flutter/material.dart';

import 'TBrandCard.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_fn.dart';
import '../custome_shapes/containers/TRoundedContainer.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      
      showBorder: true,
      backgroudColor: Colors.transparent,
      borderColor: TColors.grey,
      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5 ),
      padding: const EdgeInsets.all(
        TSizes.md,
      ),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBwItems),
      child: Column(
        children: [
          // --- Brand with product count
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBwItems),

          // --- Brand top 3 product Image
          Row(
            children: images
                .map((image) => brandTopProductImage(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImage(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backgroudColor:
          THelperFunction.isDarkMode(context) ? TColors.black : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.sm),
      padding: const EdgeInsets.only(right: TSizes.sm),
      child:  Image(
          fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}