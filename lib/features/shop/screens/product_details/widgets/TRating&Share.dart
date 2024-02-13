import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class TRatingandShare extends StatelessWidget {
  const TRatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Row(
          children: [
            const Icon(Iconsax.star1, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '4.6 ', style: Theme.of(context).textTheme.bodyMedium),
                  const TextSpan(text: '(128)')
                ],
              ),
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: 30,))
      ],
    );
  }
}