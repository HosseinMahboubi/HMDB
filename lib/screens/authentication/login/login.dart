import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hmdb/screens/authentication/login/widgets/form_divider.dart';
import 'package:hmdb/screens/authentication/login/widgets/login_form.dart';
import 'package:hmdb/screens/authentication/login/widgets/login_header.dart';
import 'package:hmdb/screens/authentication/login/widgets/sign_text.dart';
import 'package:hmdb/screens/authentication/login/widgets/social_buttons.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/constants/spacing_styles.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HMSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: HMSizes.spaceBtwItems),

              /// --- Increased spacing before the Sign In Text ---
              const SizedBox(height: HMSizes.spaceBtwSections),

              /// -- SIGN IN TEXT --
              const HMSignText(signText: "sign_in"),

              // --- Reduced spacing ---
              const SizedBox(height: HMSizes.spaceBtwSections * 2),

              /// -- TITLE AND SUB-TITLE --
              const HMLoginHeader(),

              const SizedBox(height: HMSizes.spaceBtwSections / 2),

              /// -- FORM --
              HMLoginForm(dark: dark),

              /// -- DIVIDER --
              HMFormDivider(
                  dark: dark,
                  dividerText:
                      'or_sign_in_with'.translate(context).capitalize!),

              const SizedBox(height: HMSizes.spaceBtwSections / 2),

              /// -- FOOTER --
              const HMSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
