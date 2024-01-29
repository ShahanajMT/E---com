import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // ---- Variables ---- //
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


  // ---- update Current index when page scroll ---- //
  void updatePageIndicator(index) {
     currentPageIndex.value = index;
  }


  // ----- jump to the specific dot selected ------ //

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // ------ update current index and jump to next page ----- //

  void nextPage() {
    if (currentPageIndex.value == 2) {
     // Get.to(LoginPage())
     log('NextPage');
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // ------ update current index and jump to last page ----- //

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
