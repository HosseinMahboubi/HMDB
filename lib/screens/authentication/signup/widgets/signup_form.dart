import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/signup/controller/sign_up_controller.dart';
import 'package:hmdb/screens/authentication/signup/pages/verify_email.dart';
import 'package:hmdb/screens/authentication/signup/widgets/terms_condition_checkbox.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';

class HMSignupForm extends StatelessWidget {
  const HMSignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLERS --
    final controller = Get.put(SignUpController());

    /// --- Responsive dimensions ---
    final double spacing =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height

    return Form(
      child: Column(
        children: [
          /// --- Username field - connect to controller ---
          TextFormField(
            controller: controller.usernameController,
            expands: false,
            decoration: InputDecoration(
              labelText: 'username'.translate(context),
              prefixIcon: const Icon(Iconsax.user),
            ),
          ),

          SizedBox(height: spacing),

          /// -- EMAIL --
          TextFormField(
            controller: controller.emailController,
            expands: false,
            decoration: InputDecoration(
              labelText: 'email'.translate(context),
              prefixIcon: Icon(dark ? Icons.mail : Icons.mail_outline),
            ),
          ),

          SizedBox(height: spacing),

          /// -- PASSWORD --
          Obx(
            () => TextFormField(
              obscureText: controller.obscurePassword.value,
              decoration: InputDecoration(
                labelText: 'password'.translate(context),
                prefixIcon: Icon(dark ? Iconsax.lock5 : Iconsax.lock),
                suffixIcon: IconButton(
                  /// --- Using the controller method ---
                  onPressed: controller.togglePasswordVisibility,
                  icon: Icon(
                    controller.obscurePassword.value
                        ? (dark ? Iconsax.eye_slash5 : Iconsax.eye_slash)
                        : (dark ? Icons.remove_red_eye : Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: spacing),

          /// -- CONFIRM PASSWORD --
          Obx(
            () => TextFormField(
              obscureText: controller.obscureConfirmPassword.value,
              decoration: InputDecoration(
                labelText: 'confirm_password'.translate(context),
                prefixIcon: Icon(dark ? Iconsax.lock5 : Iconsax.lock),
                suffixIcon: IconButton(
                  /// --- Using the controller method ---
                  onPressed: controller.toggleConfirmPasswordVisibility,
                  icon: Icon(
                    controller.obscureConfirmPassword.value
                        ? (dark ? Iconsax.eye_slash5 : Iconsax.eye_slash)
                        : (dark ? Icons.remove_red_eye : Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: spacing),

          /// -- PHONE NUMBER --
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: controller.countryCodeController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(dark ? Iconsax.call5 : Iconsax.call),
                    prefixText: '+',
                    counterText: '',
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(width: spacing / 2),
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: controller.phoneController,
                  decoration: InputDecoration(
                    labelText: 'phone_number'.translate(context),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),

          SizedBox(height: spacing),

          /// -- TERMS AND CONDITION CHECKBOX --
          HMTermsAndConditionCheckbox(dark: dark),

          SizedBox(height: spacing),

          /// -- SIGN UP BUTTON --
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (!controller.agreeToTerms.value) {
                  /// --- Show popup error if terms not accepted  ---
                  Get.dialog(
                    AlertDialog(
                      title: Text('agreement_required'.translate(context)),
                      content: Text(
                        'you_have_to_accept_our_policy_to_continue'
                            .translate(context),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text('ok'.translate(context)),
                        ),
                      ],
                    ),
                  );
                } else {
                  Get.to(() => const VerifyEmailScreen());
                }
              },
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
              child: Text('create_account'.translate(context)),
            ),
          ),
        ],
      ),
    );
  }
}
