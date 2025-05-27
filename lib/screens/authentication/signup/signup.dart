import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/login/widgets/form_divider.dart';
import 'package:hmdb/screens/authentication/login/widgets/sign_text.dart';
import 'package:hmdb/screens/authentication/login/widgets/social_buttons.dart';
import 'package:hmdb/screens/authentication/signup/widgets/signup_form.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive dimensions ----
    final double spacing =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.05), // ~5% of screen width
          child: Column(
            children: [
              /// -- TITLE --
              const HMSignText(signText: 'sign_up'),

              SizedBox(height: spacing),

              /// -- SUBTITLE --
              Text(
                'sign_up_subtitle'.translate(context),
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: spacing),

              /// -- FORM --
              HMSignupForm(dark: dark),

              SizedBox(height: spacing),

              /// -- DIVIDER --
              HMFormDivider(
                dark: dark,
                dividerText: 'or_sign_up_with'.translate(context).capitalize!,
              ),
              SizedBox(height: spacing / 2),

              /// -- SOCIAL BUTTONS --
              const HMSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
