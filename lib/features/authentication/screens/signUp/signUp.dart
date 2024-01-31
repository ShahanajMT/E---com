import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/TFormDivider.dart';
import 'package:tstore/common/styles/widgets/TSocialButtons.dart';
import 'package:tstore/features/authentication/screens/signUp/verifyEmail.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // title
            Text(TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBwSections),
            // Forms
            Form(
              child: Column(
                children: [
                  //! firstName and lastName
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          //style: Theme.of(context).textTheme.headlineMedium,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.firstName,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBwInputFeilds),
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.lastName,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBwInputFeilds),
                  //! userName
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.userName,
                      prefixIcon: Icon(Iconsax.user_edit),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBwInputFeilds),

                  //! email

                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.direct),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBwInputFeilds),

                  //! phoneNo

                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.phoneNo,
                      prefixIcon: Icon(Iconsax.call),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBwInputFeilds),

                  //! password

                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: Icon(Iconsax.eye_slash),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBwInputFeilds),

                  //! terms&Condition Checkbox

                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(value: true, onChanged: (value) {}),
                      ),
                      const SizedBox(width: TSizes.spaceBwItems),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: '${TTexts.iAgreeTo} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                            text: '${TTexts.privacyPolicy} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color:
                                        dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        dark ? TColors.white : TColors.primary),
                          ),
                          TextSpan(
                              text: '${TTexts.and} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                            text: '${TTexts.termsOfUse} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color:
                                        dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        dark ? TColors.white : TColors.primary),
                          ),
                        ]),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBwSections),

                  //! signUp Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () => Get.to(() => const VerifyEmailScreen()),
                      child: const Text(TTexts.createAccount),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBwSections),

            // Divider
            TFormDivider(dividerText: TTexts.orSignInWith, dark: dark),
            const SizedBox(height: TSizes.spaceBwSections),

            // social
            const TSocialButtons(),
          ]),
        ),
      ),
    );
  }
}
