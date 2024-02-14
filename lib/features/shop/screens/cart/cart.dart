import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/texts/productPriceText.dart';
import 'package:tstore/utils/constants/sizes.dart';

import '../../../../common/styles/widgets/products/cart/TCartItem.dart';
import 'widgets/TProductqty_add_remove.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          separatorBuilder: (_, __) {
            return const SizedBox(height: TSizes.spaceBwSections);
          },
          itemBuilder: (_, index) {
            return const Column(
              children: [
                TCartItem(),
                SizedBox(height: TSizes.spaceBwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    
                    Row(
                      children: [

                        // ---Extra space
                          SizedBox(width: 70),

                        // ---- Add Remove Button
                        TProductQtyWithAddAndRemove(),

                        
                      ],
                    ),

                    // --- Price
                    TProductPriceText(price: '234',)

                  ],
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))) ,child: const Text('CheckOut \$234')),
      ),
    );
  }
}


