import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  /// -- FORM CONTROLLER --
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final countryCodeController = TextEditingController();

  /// -- OBSERVER STATES --
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;

  /// --- Terms and Condition Page 👇 ---
  final RxBool agreeToTerms = false.obs;

  /// ========= METHODS ===========

  /// -- TOGGLE PASSWORD VISIBILITY --
  void togglePasswordVisibility() =>
      obscurePassword.value = !obscurePassword.value;

  /// -- TOGGLE CONFIRM PASSWORD VISIBILITY --
  void toggleConfirmPasswordVisibility() =>
      obscureConfirmPassword.value = !obscureConfirmPassword.value;

  /// -- TOGGLE TERMS AGREEMENT --
  /// --- Terms and Condition Page 👇 ---
  void toggleTermsAgreement(bool? value) => agreeToTerms.value = value ?? false;

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryCodeController.dispose();
    super.onClose();
  }
}
