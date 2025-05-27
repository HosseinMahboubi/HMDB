import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class HMLoginHeader extends StatelessWidget {
  const HMLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// --- Responsive dimensions ---
    final double spacing =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "login_title".translate(context),
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: spacing),
            Center(
              child: Text(
                "login_subtitle".translate(context),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
