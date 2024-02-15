import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (_, index) {
        return TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          showBorder: true,
          backgroudColor: darkMode ? TColors.dark : TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Row 1
              Row(
                children: [
                  // Icon
                  const Icon(Iconsax.ship),
                  const SizedBox(width: TSizes.spaceBwItems / 2),

                  // Status and Date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text(
                          '17 Nov 2023',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                  // Icon
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                        size: TSizes.iconSm,
                      ))
                ],
              ),

              const SizedBox(height: TSizes.spaceBwItems),

              // Row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Icon
                        const Icon(Iconsax.tag),
                        const SizedBox(width: TSizes.spaceBwItems / 2),

                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('[#265836]',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        // Icon
                        const Icon(Iconsax.calendar),
                        const SizedBox(width: TSizes.spaceBwItems / 2),

                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('25 Nov, 2023',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: TSizes.spaceBwItems);
      },
      
    );
  }
}
