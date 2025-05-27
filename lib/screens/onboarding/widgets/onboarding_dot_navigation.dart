import 'package:flutter/material.dart';
import 'package:hmdb/screens/onboarding/controller/onboarding_controller.dart';
import 'package:hmdb/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// --- 👇 Third step of movable dots (Create a New Instance of OnBoardingController) ---
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: HMDeviceUtils.getBottomNavigationBarHeight() + 80,
      left: 0,
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          /// --- 👇 4 and 5 step of movable dots (Create a New Instance of OnBoardingController) ---
          controller: controller.pageController,
          count: 3,
          effect: WormEffect(
            activeDotColor: Theme.of(context).primaryColor,
            dotWidth: 8,
            dotHeight: 8,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}
