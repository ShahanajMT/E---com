import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tstore/features/authentication/controllers/onBoarding/onBoaring_controller.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/device_utility.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // -- to set mode --- //
    final dark = THelperFunction.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect:  ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light :  TColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
