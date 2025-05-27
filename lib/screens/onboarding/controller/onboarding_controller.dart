import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  /// --- Find an Instance when it's called ---
  static OnBoardingController get instance => Get.find();

  /// -- VARIABLES --

  /// --- Page Controller for PageView Widget ---
  final pageController = PageController();

  /// --- Keep Track of Current Page Index ---
  Rx<int> currentPageIndex = 0.obs;

  /// -- METHODS --

  /// --- Update Current Index when Page Scroll ---
  void updatePageIndicator(index) => currentPageIndex.value = index;
}
