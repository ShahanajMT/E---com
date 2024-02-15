import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/brand/TBrandCard.dart';
import 'package:tstore/common/styles/widgets/layout/TGridlayout.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/features/shop/screens/brands/brand_products.dart';
import 'package:tstore/utils/constants/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Headings
              const TSectionHeading(title: 'Brands', showActionButton: true),
              const SizedBox(height: TSizes.spaceBwItems),

              // Brands
              TGridLayout(itemCount: 50, mainAxisExtent: 80,itemBuilder: (context, index) =>  TBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts()),))
            ],
          ),
        ),
      ),
    );
  }
}
