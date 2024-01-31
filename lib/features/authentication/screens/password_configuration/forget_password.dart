import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:tstore/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! ---- Heading ------ !//
              Text(TTexts.forgetPassword,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBwItems),
              Text(TTexts.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: TSizes.spaceBwSections * 2),

              //! ---- TextFeilds ------ !//
              TextFormField(
                decoration: const InputDecoration(
                    labelText: TTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(height: TSizes.spaceBwSections),
              //! ---- SubmitButton ------ !//
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => const ResetPassword()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Submit')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
