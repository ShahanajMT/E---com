// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/features/authentication/controllers/forgetPassword/forget_passwordController.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';

import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';

import '../../../../utils/helpers/helper_fn.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // ! image with 60% of screen width

              Image(
                  image: const AssetImage(TImages.onBoardingImage3),
                  width: THelperFunction.screenWidth() * 0.7),
              const SizedBox(height: TSizes.spaceBwSections),

              // ! Email ,Titlel and SubTitle

              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBwItems),

              Text(TTexts.changePasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBwItems),
              Text(TTexts.changePasswordSubTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBwSections),

              // ! Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(()=> const LogInPage()),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(TTexts.done)),
              ),
              const SizedBox(height: TSizes.spaceBwSections),
              // ! resentEmail TextButton
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
