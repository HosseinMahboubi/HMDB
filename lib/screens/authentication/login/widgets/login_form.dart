import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/navigation/navigation_menu.dart';
import 'package:hmdb/screens/authentication/login/controller/login_controller.dart';
import 'package:hmdb/screens/authentication/login/pages/forget_password.dart';
import 'package:hmdb/screens/authentication/signup/signup.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';

class HMLoginForm extends StatelessWidget {
  const HMLoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLERS --
    final controller = Get.put(LoginController());

    /// --- Responsive dimensions ---
    final double paddingVertical =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height
    final double iconSize =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width

    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        child: Column(
          children: [
            /// -- USERNAME --
            TextFormField(
              controller: controller.usernameController,

              /// --- 👆 Added to the controller ---

              decoration: InputDecoration(
                prefixIcon:
                    Icon(dark ? Iconsax.user : Iconsax.user, size: iconSize),
                labelText: 'username'.translate(context),
              ),
            ),

            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.015), // ~1.5% of screen height

            /// -- PASSWORD --
            Obx(
              () => TextFormField(
                obscureText: controller.obscureText.value,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(dark ? Iconsax.lock5 : Iconsax.lock, size: iconSize),
                  labelText: 'password'.translate(context),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureText.value
                          ? (dark ? Iconsax.eye_slash5 : Iconsax.eye_slash)
                          : (dark
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye),
                      size: iconSize,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
              ),
            ),

            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.01), // ~1% of screen height

            /// -- REMEMBER ME and FORGET PASSWORD  --
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// --- Remember Me ---
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: controller.toggleRememberMe,
                      ),
                    ),
                    Text('remember_me'.translate(context)),
                  ],
                ),

                /// --- Forget Password ---
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: Text('forget_password'.translate(context)),
                ),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.02), // ~2% of screen height

            /// -- SIGN IN BUTTON --
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String username = controller.usernameController.text;
                  Get.to(
                    () => NavigationMenu(
                      username: username.isEmpty ? "Admin" : username,
                    ),
                  );
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
                child: Text('sign_in'.translate(context)),
              ),
            ),

            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.015), // ~1.5% of screen height

            /// -- CREATE ACCOUNT BUTTON --
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: dark ? HMColors.primary : HMColors.buttonSecondary,
                    width: 1.5,
                  ),
                  foregroundColor:
                      dark ? HMColors.primary : HMColors.buttonSecondary,
                ),
                child: Text('create_account'.translate(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
