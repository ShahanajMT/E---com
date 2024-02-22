import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/login_signUp/TFormDivider.dart';
import 'package:tstore/common/styles/widgets/login_signUp/TSocialButtons.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import 'Widgets/TSignupForm.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(TTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBwSections),
              // Forms
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBwSections),

              // Divider
              TFormDivider(dividerText: TTexts.orSignInWith, dark: dark),
              const SizedBox(height: TSizes.spaceBwSections),

              // social
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


