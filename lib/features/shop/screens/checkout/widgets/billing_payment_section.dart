import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return  Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {},),
        const SizedBox(height: TSizes.spaceBwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              height: 35,
              width: 60,
              backgroudColor: darkMode ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.google_pay), fit: BoxFit.contain),
            ),
            const SizedBox(width: TSizes.spaceBwItems / 2),
            Text('PayPal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ],
    );
  }
}