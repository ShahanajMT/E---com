// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'package:tstore/common/styles/spacingStyles.dart';

import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import 'widgets/TFormDivider.dart';
import 'widgets/TLoginForm.dart';
import 'widgets/TLoginHeader.dart';
import 'widgets/TSocialButtons.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // --- Logo, Title & SubTitle
              TLoginHeader(dark: dark),
              // ---- Form ----- //
              const TLoginForm(),

              // -- Divider --- //
              TFormDivider(
                dark: dark,
                dividerText: TTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(
                height: TSizes.spaceBwSections,
              ),
              // footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
