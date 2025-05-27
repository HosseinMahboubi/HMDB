import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/image_strings.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';

class HMSocialButtons extends StatelessWidget {
  const HMSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive dimensions ---
    final double iconSize =
        MediaQuery.of(context).size.width * 0.08; // ~8% of screen width
    final double spacing =
        MediaQuery.of(context).size.width * 0.04; // ~4% of screen width

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
            icon: Image.asset(
              HMImages.facebook,
              width: iconSize,
              height: iconSize,
            ),
          ),
        ),
        SizedBox(width: spacing),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: dark ? HMColors.darkGrey : HMColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              HMImages.google,
              width: iconSize,
              height: iconSize,
            ),
          ),
        ),
        SizedBox(width: spacing),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: dark ? HMColors.darkGrey : HMColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              HMImages.x,
              width: iconSize,
              height: iconSize,
            ),
          ),
        ),
      ],
    );
  }
}
