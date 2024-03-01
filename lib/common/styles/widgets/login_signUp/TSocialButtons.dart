import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/features/authentication/controllers/login/login_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(

          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: TSizes.md,
              height: TSizes.md,
              image: AssetImage(TImages.google),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBwItems,),
         Container(
          decoration: BoxDecoration(
            // color: Colors.yellow,
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.md,
              height: TSizes.md,
              image: AssetImage(TImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}