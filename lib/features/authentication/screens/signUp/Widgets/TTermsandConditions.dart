import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/signUp/signup_controller.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = SignupController.instaance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: '${TTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary),
            ),
            TextSpan(
                text: '${TTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: '${TTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary),
            ),
          ]),
        ),
      ],
    );
  }
}
