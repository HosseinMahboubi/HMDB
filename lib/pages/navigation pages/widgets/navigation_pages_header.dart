import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/localization/app_localizations.dart';

class HMNavigationPageHeader extends StatelessWidget {
  const HMNavigationPageHeader({
    super.key,
    required this.dark,
    required this.text,
    required this.subText,
  });

  final bool dark;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(HMSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate(text),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: dark ? HMColors.white : HMColors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).translate(subText),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: dark ? HMColors.lightGrey : HMColors.darkGrey,
                ),
          ),
        ],
      ),
    );
  }
}
