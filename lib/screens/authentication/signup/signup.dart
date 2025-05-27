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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HMSizes.defaultSpace),
          child: Column(
            children: [
              /// -- TITLE --
              const HMSignText(signText: 'sign_up'),

              const SizedBox(height: HMSizes.spaceBtwSections),

              /// -- SUBTITLE --
              Text(
                'sign_up_subtitle'.translate(context),
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: HMSizes.spaceBtwSections),

              /// -- FORM --
              HMSignupForm(dark: dark),

              const SizedBox(height: HMSizes.spaceBtwSections),

              /// -- DIVIDER --
              HMFormDivider(
                dark: dark,
                dividerText: 'or_sign_up_with'.translate(context).capitalize!,
              ),
              const SizedBox(height: HMSizes.spaceBtwSections / 2),

              /// -- SOCIAL BUTTONS --
              const HMSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
