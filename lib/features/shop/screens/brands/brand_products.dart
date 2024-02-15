import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/products/SortableProducts/TSortableProducts.dart';
import 'package:tstore/utils/constants/sizes.dart';

import '../../../../common/styles/widgets/brand/TBrandCard.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: TAppBar(
        title: Text('Nike')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
             TBrandCard(showBorder: true),
             SizedBox(height: TSizes.spaceBwSections),


             TSortableProducts(),

            ],
          ),
        ),
      ),
    );
  }
}
