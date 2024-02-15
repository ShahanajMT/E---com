import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../layout/TGridlayout.dart';
import '../product_cart/TProductCart_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //! Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Name',
            'Higjer Price',
            'Lower Price',
            'Style',
            'Newest',
            'Popularity'
          ]
              .map((options) => DropdownMenuItem(value: options,child: Text(options),))
              .toList(),
              
          onChanged: (value) {},
        ),

        const SizedBox(height: TSizes.spaceBwItems),
        //! Products
        TGridLayout(itemCount: 10, itemBuilder: (_, index) => const TProductCardVertical())
      ],
    );
  }
}