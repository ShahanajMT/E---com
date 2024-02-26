

// ignore: avoid_web_libraries_in_flutter


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';
import 'package:tstore/utils/loder/animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false, // Prevent back button from closing the dialog
        child: Container(
          color: THelperFunction.isDarkMode(Get.context!) ? TColors.dark : TColors.white, // Transparent background
          width: double.infinity,
          height: double.infinity,
          child:  SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),
                TAnimationLoderWidget(text: text, animation: animation)
          
              ],
            ),
          )
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
