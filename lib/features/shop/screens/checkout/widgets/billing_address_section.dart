import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {},),
         Text('T - Store', style: Theme.of(context).textTheme.bodyLarge),
         const SizedBox(height: TSizes.spaceBwItems / 2),

         Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 18),
            const SizedBox(width: TSizes.spaceBwItems),
            Text('+ 974 55635 3345', style: Theme.of(context).textTheme.bodyLarge,)
          ],
         ),
          const SizedBox(height: TSizes.spaceBwItems / 2),
          Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 18),
            const SizedBox(width: TSizes.spaceBwItems),
            Flexible(child: Text('BTM Layout, 17 th Cross Road, Gate 3, Banglore II', style: Theme.of(context).textTheme.bodyLarge, softWrap: true,))
          ],
         ),
         const SizedBox(height: TSizes.spaceBwItems / 2),


      ],
    );
  }
}