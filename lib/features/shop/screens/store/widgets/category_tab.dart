// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tstore/common/styles/widgets/layout/TGridlayout.dart';
import 'package:tstore/common/styles/widgets/products/product_cart/TProductCart_vertical.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/features/shop/models/category_model.dart';

import '../../../../../common/styles/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // --- Brands
            const TBrandShowcase(
              images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ],
            ),
    
            // --- Products
            TSectionHeading(title: 'You might like', onPressed: () {}),
            const SizedBox(height: TSizes.spaceBwItems),
    
            TGridLayout(
              itemCount: 4,
              itemBuilder: (_, index) {
                return const TProductCardVertical();
              },
            ),
            const SizedBox(height: TSizes.spaceBwSections),
          ],
        ),
      ),
      ],
    );
  }
}
