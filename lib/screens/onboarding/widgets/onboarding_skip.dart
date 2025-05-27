import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/authentication/login/login.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 16,
      child: IconButton(
        color: HMHelperFunction.isDarkMode(context)
            ? HMColors.primary
            : HMColors.black,
        onPressed: () => Get.to(() => const LoginScreen()),
        icon: const Icon(CupertinoIcons.clear),
      ),
    );
  }
}
