import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/login/controller/login_controller.dart';
import 'package:hmdb/screens/authentication/login/pages/reset_password.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLERS --
    final controller = Get.put(LoginController());

    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive dimensions ---
    final double padding =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double buttonHeight =
        MediaQuery.of(context).size.height * 0.06; // ~6% of screen height

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Form(
            key: controller.formKey, // --- Using Controller --
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// -- HEADING --
                Text(
                  'forget_password'.translate(context),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.02), // ~2% of screen height

                /// -- SUBTITLE --
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: dark
                              ? HMColors.white.withOpacity(0.7)
                              : HMColors.textSecondary,
                          height: 1.5,
                          fontSize: MediaQuery.of(context).size.width *
                              0.035, // ~3.5% of screen width
                        ),
                    text: "forget_password_subtitle".translate(context),
                  ),
                ),

                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.03), // ~3% of screen height

                /// -- TEXT FIELD --
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(dark ? Icons.mail : Icons.mail_outline_rounded),
                    labelText: 'email'.translate(context),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please_enter_your_email_address'
                          .translate(context);
                    }
                    return null;
                  },
                ),

                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.02), // ~2% of screen height

                // -- SUBMIT BUTTON --
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      /// --- Validate the form before proceeding ---
                      if (controller.formKey.currentState!.validate()) {
                        Get.to(() => const ResetPassword());
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
                      padding: EdgeInsets.symmetric(
                          vertical: buttonHeight * 0.5), // ~3% of screen height
                    ),
                    child: Text('submit'.translate(context)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
