import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/features/authentication/controllers/onBoarding/onBoaring_controller.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/device_utility.dart';

class OnBoardingCircularButton extends StatelessWidget {
  const OnBoardingCircularButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(side: BorderSide.none),
          backgroundColor: dark ? TColors.primary : TColors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}