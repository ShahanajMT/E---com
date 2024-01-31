import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tstore/features/authentication/controllers/onBoarding/onBoaring_controller.dart';
import 'package:tstore/features/authentication/screens/onBoarding/widgets/onBoardingCirBu.dart';

import 'package:tstore/utils/constants/image_strings.dart';

import 'package:tstore/utils/constants/text_strings.dart';

import 'widgets/onBoardingDotNav.dart';
import 'widgets/onBoarding_skip.dart';
import 'widgets/onBoardinga_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // -- GetX ---- //
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // --- Horizontal scroll pages ----- //
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoarding(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoarding(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoarding(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // --- skipButton ---- //
          const OnBoardingSkip(),

          // ---- Dot navigation smoothPage Indicator ---- //
          const OnBoardingDotNavigation(),

          // ---- CircularButton ----- //
          const OnBoardingCircularButton()
        ],
      ),
    );
  }
}
