import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/splash/controller/splash_screen_controller.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/image_strings.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/app_localizations.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
/*
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLERS --
    final controller = Get.put(SplashScreenController());

    /// --- 👆 ---
    final dark = HMHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: dark ? HMColors.blackBackGround : HMColors.white,
        ),
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                /// --- Animation Controller based on Splash Screen Controller Page ---
                animation: controller.animationController,
                builder: (context, child) {
                  return ScaleTransition(
                    /// --- Scale Animation based on Splash Screen Controller Page ---
                    scale: controller.scaleAnimation,
                    child: FadeTransition(
                      /// --- Fade Animation based on Splash Screen Controller Page ---
                      opacity: controller.fadeAnimation,
                      child: Column(
                        /// -- MAKES IT CENTER OF THE PAGE --
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// -- LOGO --
                          Container(
                            width: size.width * 0.4,
                            height: size.width * 0.4,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Image.asset(
                                HMImages.appsplashlogo,

                                /// --- Change it to * 0.35 if you don't like ---
                                width: size.width,

                                /// --- Change it to * 0.35 if you don't like ---
                                height: size.width,
                              ),
                            ),
                          ),

                          const SizedBox(height: HMSizes.spaceBtwItems),

                          /// -- APP NAME --
                          Text(
                            "HMDB",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: dark
                                      ? HMColors.primary
                                      : HMColors.blackBackGround,
                                  letterSpacing: 1.5,
                                ),
                          ),

                          const SizedBox(height: HMSizes.spaceBtwItems),

                          /// -- SUBTEXT --
                          Text(
                            "app_tag_line".translate(context),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: dark
                                          ? Colors.grey.shade400
                                          : Colors.grey.shade700,
                                      letterSpacing: 0.5,
                                    ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(
                              height: HMSizes.spaceBtwSections * 1.5),

                          /// -- LOADING INDICATOR --
                          SizedBox(
                            width: 45,
                            height: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: LinearProgressIndicator(
                                backgroundColor: dark
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade300,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  dark
                                      ? HMColors.primary
                                      : HMColors.loadingLightIndicator,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLERS --
    final controller = Get.put(SplashScreenController());

    /// --- 👆 ---
    final dark = HMHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: dark ? HMColors.blackBackGround : HMColors.white,
        ),
        child: Stack(
          children: [
            // Main content centered
            Center(
              child: AnimatedBuilder(
                /// --- Animation Controller based on Splash Screen Controller Page ---
                animation: controller.animationController,
                builder: (context, child) {
                  return ScaleTransition(
                    /// --- Scale Animation based on Splash Screen Controller Page ---
                    scale: controller.scaleAnimation,
                    child: FadeTransition(
                      /// --- Fade Animation based on Splash Screen Controller Page ---
                      opacity: controller.fadeAnimation,
                      child: Column(
                        /// -- MAKES IT CENTER OF THE PAGE --
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// -- LOGO --
                          Container(
                            width: size.width * 0.7,
                            height: size.width * 0.7,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Image.asset(
                                dark
                                    ? HMImages.appsplashlogo
                                    : HMImages.appsplashlogo,

                                /// --- Change it to * 0.35 if you don't like ---
                                width: size.width,

                                /// --- Change it to * 0.35 if you don't like ---
                                height: size.width,
                              ),
                            ),
                          ),

                          const SizedBox(height: HMSizes.sm / 2),

                          /// -- APP NAME --
                          // Text(
                          //   "CINEMORA",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .headlineMedium
                          //       ?.copyWith(
                          //         fontWeight: FontWeight.bold,
                          //         color: dark
                          //             ? CMColors.primary
                          //             : CMColors.blackBackGround,
                          //         letterSpacing: 1.5,
                          //       ),
                          // ),

                          const SizedBox(height: HMSizes.spaceBtwItems),

                          /// -- LOADING INDICATOR --

                          // SizedBox(
                          //   width: 45,
                          //   height: 5,
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(50),
                          //     child: LinearProgressIndicator(
                          //       backgroundColor: dark
                          //           ? Colors.grey.shade800
                          //           : Colors.grey.shade300,
                          //       valueColor: AlwaysStoppedAnimation<Color>(
                          //         dark
                          //             ? CMColors.primary
                          //             : CMColors.loadingLightIndicator,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /// -- CIRCULAR LOADING INDICATOR AT BOTTOM --
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: controller.animationController,
                    curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          backgroundColor: dark
                              ? Colors.grey.shade800
                              : Colors.grey.shade300,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            dark ? HMColors.secondPrimary : HMColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        AppLocalizations.of(context)
                            .translate("loading_cinema_experience"),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: dark ? Colors.grey[400] : Colors.grey[700],
                              letterSpacing: 1.0,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        AppLocalizations.of(context).translate("app_version"),
                        style: TextStyle(
                          fontSize: 12,
                          color: dark ? Colors.grey[600] : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
