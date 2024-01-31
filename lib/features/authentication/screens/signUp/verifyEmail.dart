import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/success_screen/success_screen.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LogInPage()), icon: const Icon(Iconsax.close_square))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // image
              Image(image: const AssetImage(TImages.onBoardingImage1), width: THelperFunction.screenWidth() * 0.7),
              const SizedBox(height: TSizes.spaceBwSections),

              // Titlel and SubTitle
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
               const SizedBox(height: TSizes.spaceBwItems),
               Text('example@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
               const SizedBox(height: TSizes.spaceBwItems),
                Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
               const SizedBox(height: TSizes.spaceBwSections),

              // Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() =>  SuccessScreen(onPressed:  () => Get.to(() => const LogInPage()), image: TImages.onBoardingImage2, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle)),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),  child: const Text(TTexts.tContinue)), ),
              const SizedBox(height: TSizes.spaceBwSections),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(TTexts.resendEmail)),),
            ],
          ),
        ),
      ),
    );
  }
}
