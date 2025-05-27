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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          signText.translate(context),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
