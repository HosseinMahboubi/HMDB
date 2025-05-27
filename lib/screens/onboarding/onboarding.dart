import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/onboarding/controller/onboarding_controller.dart';
import 'package:hmdb/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:hmdb/screens/onboarding/widgets/onboarding_pages.dart';
import 'package:hmdb/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:hmdb/utils/constants/image_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// --- First step of movable dots (Create a New Instance of OnBoardingController) ---
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// -- HORIZONTAL SCROLLABLE PAGES --
          PageView(
            /// --- 👇 Second step of movable dots (Create a New Instance of OnBoardingController) ---
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: HMImages.onBoardingImage1,
                titleKey: "onboarding_title_1",
                subTitleKey: "onboarding_subtitle_1",
              ),
              OnBoardingPage(
                image: HMImages.onBoardingImage2,
                titleKey: "onboarding_title_2",
                subTitleKey: "onboarding_subtitle_2",
              ),
              OnBoardingPage(
                image: HMImages.onBoardingImage3,
                titleKey: "onboarding_title_3",
                subTitleKey: "onboarding_subtitle_3",
              ),
            ],
          ),

          /// -- DOT NAVIGATION SMOOTH PAGE INDICATOR --
          const OnBoardingDotNavigation(),

          /// -- SKIP BUTTON --
          const OnBoardingSkip(),
        ],
      ),
    );
  }
}
