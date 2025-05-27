import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/login/login.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/image_strings.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive dimensions ---
    final double imageWidth =
        MediaQuery.of(context).size.width * 0.6; // ~60% of screen width
    final double padding =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double buttonHeight =
        MediaQuery.of(context).size.height * 0.06; // ~6% of screen height

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              /// -- SVG IMAGE --
              Center(
                child: SvgPicture.asset(
                  HMImages.resendEmail,
                  width: imageWidth,
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.03), // ~3% of screen height

              /// -- TITLE AND SUBTITLE --
              Text(
                'change_your_password_title'.translate(context),
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // ~2% of screen height
              Text(
                'change_your_password_subtitle'.translate(context),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.03), // ~3% of screen height

              /// -- BUTTONS --
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
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
                  child: Text('done'.translate(context)),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // ~2% of screen height
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
