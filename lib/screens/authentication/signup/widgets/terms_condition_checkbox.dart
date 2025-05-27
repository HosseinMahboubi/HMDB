import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/signup/controller/sign_up_controller.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class HMTermsAndConditionCheckbox extends StatelessWidget {
  const HMTermsAndConditionCheckbox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLERS --
    final controller = Get.put(SignUpController());

    /// --- Responsive dimensions ---
    final double checkboxSize =
        MediaQuery.of(context).size.width * 0.06; // ~6% of screen width
    final double spacing =
        MediaQuery.of(context).size.width * 0.04; // ~4% of screen width

    return Row(
      children: [
        SizedBox(
          width: checkboxSize,
          height: checkboxSize,
          child: Obx(
            () => Checkbox(
              value: controller.agreeToTerms.value,
              onChanged: controller.toggleTermsAgreement,
            ),
          ),
        ),
        SizedBox(width: spacing),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${'i_agree_to'.translate(context)} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${'privacy_policy'.translate(context)} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? HMColors.white : HMColors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? HMColors.white : HMColors.blue,
                    ),
              ),
              TextSpan(
                text: '${'and'.translate(context)} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${'terms_of_use'.translate(context)} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? HMColors.white : HMColors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? HMColors.white : HMColors.blue,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
