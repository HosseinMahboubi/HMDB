import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/login/login.dart';

/// -- CONTROLLER FOR THE SPLASH SCREEN --
class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override

  /// --- onInit() => Automatically called when the controller is first created ---
  void onInit() {
    super.onInit();

    /// -- INITIALIZE ANIMATIONS --
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    /// --- Grows the widget from 40% to 100% of its size ---
    scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.1, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    /// -- START ANIMATION --
    animationController.forward();

    /// -- NAVIGATE TO LOGIN SCREEN AFTER n SECOND DELAY --
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offAll(() => const LoginScreen());
      },
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
