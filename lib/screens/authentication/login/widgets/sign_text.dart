import 'package:flutter/material.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class HMSignText extends StatelessWidget {
  const HMSignText({
    super.key,
    required this.signText,
  });

  final String signText;

  @override
  Widget build(BuildContext context) {
    /// --- Responsive font size ---
    final double fontSize =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          signText.translate(context),
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: fontSize),
        ),
      ],
    );
  }
}
