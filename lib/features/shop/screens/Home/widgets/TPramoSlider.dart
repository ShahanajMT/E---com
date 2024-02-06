// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tstore/features/shop/controllers/home_controller.dart';
import 'package:tstore/utils/constants/colors.dart';

import '../../../../../common/styles/widgets/custome_shapes/containers/circular_container.dart';
import '../../../../../common/styles/widgets/images/T_RoundedImage.dart';

import '../../../../../utils/constants/sizes.dart';

class TPramoSlider extends StatelessWidget {
  const TPramoSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  // -- another way of getting banners -> without hard codding
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) =>  TRoundImage(imageUrl: url)).toList(),
          options: CarouselOptions(
           autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            //aspectRatio: 12 / 6,
          ),
        ),
        const SizedBox(height: TSizes.spaceBwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)  TCircularContainer(width: 20, height: 5,  margin: const EdgeInsets.only(left: 10), backgroudColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,)
            ],
          ),
        )
      ],
    );
  }
}
