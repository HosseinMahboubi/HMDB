import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  /// --- Add a Text Editing Controller to "CAPTURE" the username ---
  final usernameController = TextEditingController();

  // -- OBSERVABLE STATES  --
  /// ---🔔 ".obs" makes it reactive (automatically updates the screen) ---

  /// --- Using GetX for password visibility state ---
  final RxBool obscureText = true.obs;

  /// --- Using GetX for remember me checkbox state ---
  final RxBool rememberMe = false.obs;

  /// -- TOGGLE PASSWORD VISIBILITY --
  void togglePasswordVisibility() => obscureText.value = !obscureText.value;

  /// -- TOGGLE REMEMBER ME --
  void toggleRememberMe(bool? value) => rememberMe.value = value ?? false;

  // -- CLEANUP METHOD (When it's done) --
  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }

  /// -- FORGET PASSWORD PAGE CONTROLLERS! --

  /// --- Create a form key to validate the form ---
  final formKey = GlobalKey<FormState>();

  /// --- Create a controller for the email field ---
  final emailController = TextEditingController();
}
