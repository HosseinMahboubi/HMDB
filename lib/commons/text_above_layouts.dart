import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:hmdb/utils/constants/spacing_styles.dart';

class HMAboveLayoutTexts extends StatelessWidget {
  const HMAboveLayoutTexts({
    super.key,
    required this.text,
    this.onPressed,
  });

  /// =========== VARIABLES ===========
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HMSpacingStyle.sectionPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: HMHelperFunction.isDarkMode(context)
                          ? HMColors.textSecondary
                          : HMColors.darkGrey,
                    ),
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  "see_all".translate(context),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: HMHelperFunction.isDarkMode(context)
                            ? HMColors.primary
                            : HMColors.buttonAlt,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
