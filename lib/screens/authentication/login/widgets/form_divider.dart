import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';

class HMFormDivider extends StatelessWidget {
  const HMFormDivider({
    super.key,
    required this.dark,
    required this.dividerText,
  });

  final bool dark;
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? HMColors.primary.withOpacity(0.5) : HMColors.grey,
            thickness: dark ? 0.8 : 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: dark ? HMColors.primary.withOpacity(0.8) : null,
              ),
        ),
        Flexible(
          child: Divider(
            color: dark ? HMColors.primary.withOpacity(0.5) : HMColors.grey,
            thickness: dark ? 0.8 : 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
