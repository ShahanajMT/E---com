import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/spacingStyles.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_fn.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.onPressed, required this.image, required this.title, required this.subTitle});

  final VoidCallback onPressed;
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column( 
            children: [
              // image
              Image(image:  AssetImage(image), width: THelperFunction.screenWidth() * 0.7),
              const SizedBox(height: TSizes.spaceBwSections),

              // Titlel and SubTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
               
               const SizedBox(height: TSizes.spaceBwItems),
                Text(subTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
               const SizedBox(height: TSizes.spaceBwSections),

               // Button
               SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),  child: const Text(TTexts.tContinue)), ),
              const SizedBox(height: TSizes.spaceBwSections),

            ],
          ),
        ),
      ),
    );
  }
}
