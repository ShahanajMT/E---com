import 'package:flutter/material.dart';
import 'package:tstore/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // --- SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$259',style: Theme.of(context).textTheme.labelLarge),
           
          ],
        ),
         const SizedBox(height: TSizes.spaceBwItems / 2),

         // --- Shipping Fee
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$8.05',style: Theme.of(context).textTheme.labelLarge),
           
          ],
        ),
         const SizedBox(height: TSizes.spaceBwItems / 2),

         // --- Tax Fee
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$0.75',style: Theme.of(context).textTheme.labelLarge),
           
          ],
        ),
         const SizedBox(height: TSizes.spaceBwItems / 2),

         // --- Order Total
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$345',style: Theme.of(context).textTheme.titleMedium),
           
          ],
        ),
         const SizedBox(height: TSizes.spaceBwItems / 2),
      ],
    );
  }
}