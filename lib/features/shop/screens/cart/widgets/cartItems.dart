// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../common/styles/widgets/products/cart/TCartItem.dart';
import '../../../../../common/styles/widgets/texts/productPriceText.dart';
import '../../../../../utils/constants/sizes.dart';
import 'TProductqty_add_remove.dart';

class ListOfCartItems extends StatelessWidget {
  const ListOfCartItems({
    Key? key,
     this.showAddRemoveButton = true,
  }) : super(key: key);

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          separatorBuilder: (_, __) {
            return const SizedBox(height: TSizes.spaceBwSections);
          },
          itemBuilder: (_, index) {
            return  Column(
              children: [
                // ! cartItems
                const TCartItems(),
                if (showAddRemoveButton) const SizedBox(height: TSizes.spaceBwItems),

                if (showAddRemoveButton)
                const Row(
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
        );
  }
}
