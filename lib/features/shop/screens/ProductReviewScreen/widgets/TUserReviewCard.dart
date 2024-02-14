import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/products/Ratings/TRatingBarIndicator.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.user),
                ),
                const SizedBox(width: TSizes.spaceBwItems),
                Text(
                  'John Britas',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        // ---- Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBwItems),
            Text('14 Feb, 2024', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBwItems),
        const ReadMoreText(
          'This user interface of app is quite initutive. i was able to navigate and make purchase seamlessy. Geart job! and it is usefull and the best of the product  ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBwItems),

        // ---- company review
        TRoundedContainer(
          backgroudColor: darkMode ? TColors.darkergrey : TColors.grey,
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('T - Store', style: Theme.of(context).textTheme.titleLarge,),
                   Text('14 Feb, 2024', style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: TSizes.spaceBwItems),
              const ReadMoreText(
          'This user interface of app is quite initutive. i was able to navigate and make purchase seamlessy. Geart job! and it is usefull and the best of the product  ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBwSections),

      ],
    );
  }
}
