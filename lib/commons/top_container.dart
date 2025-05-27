import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class HMTopContainer extends StatelessWidget {
  const HMTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(HMSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'welcome '.translate(context),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: HMHelperFunction.isDarkMode(context)
                              ? HMColors.textSecondary
                              : HMColors.darkGrey,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                  ),
                  TextSpan(
                    text: 'app_name'.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.7,
                        )
                        .apply(
                          color: HMHelperFunction.isDarkMode(context)
                              ? HMColors.primary
                              : HMColors.dark,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
