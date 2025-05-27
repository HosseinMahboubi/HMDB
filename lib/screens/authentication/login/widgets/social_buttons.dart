import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/image_strings.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';

class HMSocialButtons extends StatelessWidget {
  const HMSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: dark ? HMColors.darkGrey : HMColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: HMSizes.iconLg,
              height: HMSizes.iconLg,
              image: AssetImage(HMImages.facebook),
            ),
          ),
        ),
        const SizedBox(width: HMSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: dark ? HMColors.darkGrey : HMColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: HMSizes.iconLg,
              height: HMSizes.iconLg,
              image: AssetImage(HMImages.google),
            ),
          ),
        ),
        const SizedBox(width: HMSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: dark ? HMColors.darkGrey : HMColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              HMImages.x,
              width: HMSizes.iconLg,
              height: HMSizes.iconLg,
            ),
          ),
        ),
      ],
    );
  }
}
