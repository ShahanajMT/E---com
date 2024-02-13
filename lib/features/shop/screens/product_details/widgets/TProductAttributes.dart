import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/chips/choice_chip.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/texts/productPriceText.dart';
import 'package:tstore/common/styles/widgets/texts/productTitleText.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        // --- selected attributes for Pricing and Desccription
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroudColor: darkMode ? TColors.darkergrey : TColors.grey,
          child: Column(
            children: [
              // ---- Title, Price and Stock Status

              Row(
                children: [
                  const TSectionHeading(
                      title: 'Varibles', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Price :', smallSize: true),
                          const SizedBox(width: TSizes.spaceBwItems),
                          // --- Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBwItems),
                          // ---- Sale Price
                          const TProductPriceText(
                            price: '40',
                            isLarge: true,
                          )
                        ],
                      ),

                      // --- Stock

                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          const SizedBox(width: TSizes.spaceBwItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(width: TSizes.spaceBwItems),
                ],
              ),
              const ProductTitleText(
                title:
                    'This is the description of the product and it can go up with 4 lines........................................................,',
                maxLines: 4,
                smallSize: false,
              )
            ],
          ),
        ),

        const SizedBox(height: TSizes.spaceBwItems),

        // ---- Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBwItems / 1.5),
            Wrap(
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Pink',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),

        const SizedBox(height: TSizes.spaceBwItems),

        Column(
          children: [
            const TSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBwItems / 1.5),
            Wrap(
              spacing: 6,
              children: [
                TChoiceChip(
                  text: 'S',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'M',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'L',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'XL',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'XXL',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
