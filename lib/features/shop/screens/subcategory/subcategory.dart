import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/images/T_RoundedImage.dart';
import 'package:tstore/common/styles/widgets/products/product_cart/TProductCard_Horixontal.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const TRoundImage(
                  imageUrl: TImages.promoBanner1,
                  width: double.infinity,
                  height: 200,
                  applayImageRadius: true),
              const SizedBox(height: TSizes.spaceBwSections),

              // sub Categories
              Column(
                children: [
                  // Heading
                  TSectionHeading(
                    title: 'Sports T-Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: TSizes.spaceBwItems);
                      },
                      itemBuilder: (context, index) {
                        return const TProductCardHorizontal();
                      },
                    ),
                  ),

                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
