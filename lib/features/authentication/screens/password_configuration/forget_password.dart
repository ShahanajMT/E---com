import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/features/authentication/controllers/forgetPassword/forget_passwordController.dart';

import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';
import 'package:tstore/utils/validators/validator.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                Form(
                  key: controller.forgetPasswordFormKey,
                  
                  child: TextFormField(
                    controller: controller.email,
                    validator: TValidator.validateEmail,
                    decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBwSections),
                //! ---- SubmitButton ------ !//
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.sendPasswordResetEmail(),
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
      ),
    );
  }
}
