import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/login/login.dart';
import 'package:hmdb/screens/authentication/signup/pages/success_screen.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/image_strings.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HMSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: HMSizes.spaceBtwSections * 2),

              /// -- SVG IMAGE --
              Center(
                child: SvgPicture.asset(
                  HMImages.verifyIllustration,
                  width: HMHelperFunction.screenWidth() * 0.6,
                ),
              ),
              const SizedBox(height: HMSizes.spaceBtwSections),

              /// -- TITLE and SUBTITLE
              Text(
                'confirm_email'.translate(context),
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: HMSizes.spaceBtwItems),
              Text(
                'confirm_email_subtitle'.translate(context),
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: HMSizes.spaceBtwItems),
              Text(
                'support'.translate(context),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: HMSizes.spaceBtwSections),

              /// -- BUTTONS --
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        dark ? HMColors.primary : HMColors.buttonSecondary,
                    foregroundColor: dark ? HMColors.black : HMColors.white,
                    elevation: 0,
                    side: BorderSide(
                      color: dark ? HMColors.darkerGrey : Colors.transparent,
                      width: 0,
                    ),
                  ),
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: HMImages.staticSuccessIllustration,
                      titleKey: 'your_account_created_title',
                      subTitleKey: 'your_account_created_subtitle',
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),
                  ),
                  child: Text('continue'.translate(context)),
                ),
              ),
              const SizedBox(height: HMSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text('resend_email'.translate(context)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
