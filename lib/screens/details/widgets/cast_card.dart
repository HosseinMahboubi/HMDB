import 'package:flutter/material.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

Widget castCard(Map cast, BuildContext context) {
  /// -- CHECK IF THERE'S A TRANSLATION KEY FOR THE CAST NAME --
  String nameKey = cast['nameKey'] ?? '';
  String name = cast['name'] ?? '';

  /// -- GET THE TRANSLATED NAME IF AVAILABLE --
  String displayName = nameKey.isNotEmpty ? nameKey.translate(context) : name;

  /// --- Responsive dimensions ---
  final double imageSize =
      MediaQuery.of(context).size.width * 0.25; // ~25% of screen width
  final double borderRadius =
      MediaQuery.of(context).size.width * 0.025; // ~2.5% of screen width
  final double spacing =
      MediaQuery.of(context).size.height * 0.01; // ~1% of screen height

  return Padding(
    padding: EdgeInsets.only(
        right:
            MediaQuery.of(context).size.width * 0.025), // ~2.5% of screen width
    child: Column(
      children: [
        /// -- CAST IMAGE --
        Container(
          height: imageSize,
          width: imageSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: AssetImage(cast['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: spacing),
        SizedBox(
          width: imageSize,
          child: Text(
            displayName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
