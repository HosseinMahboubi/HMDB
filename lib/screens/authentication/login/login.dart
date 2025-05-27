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

    /// --- Responsive dimensions ---
    final double spacing =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HMSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: spacing),

              /// --- Increased spacing before the Sign In Text ---
              SizedBox(height: spacing),

              /// -- SIGN IN TEXT --
              const HMSignText(signText: "sign_in"),

              // --- Reduced spacing ---
              SizedBox(height: spacing * 2),

              /// -- TITLE AND SUB-TITLE --
              const HMLoginHeader(),

              SizedBox(height: spacing / 2),

              /// -- FORM --
              HMLoginForm(dark: dark),

              /// -- DIVIDER --
              HMFormDivider(
                  dark: dark,
                  dividerText:
                      'or_sign_in_with'.translate(context).capitalize!),

              SizedBox(height: spacing / 2),

              /// -- FOOTER --
              const HMSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
