// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/features/shop/screens/ProductReviewScreen/widgets/TUserReviewCard.dart';
import 'package:tstore/utils/constants/sizes.dart';

import '../../../../common/styles/widgets/products/Ratings/TRatingBarIndicator.dart';
import 'widgets/TOverallProductIndicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Reviews & Ratings',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and Reviews are verified and from are people who use the same type of device that you use'),
              const SizedBox(height: TSizes.spaceBwItems),

              //----- Overall product rating
              const TOverallProductindicator(),
              const TRatingBarIndicator(rating: 4.6),
              Text('12,345', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBwSections),

              // --- user Review list
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
