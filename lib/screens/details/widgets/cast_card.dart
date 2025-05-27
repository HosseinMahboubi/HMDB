import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

Widget castCard(Map cast, BuildContext context) {
  /// -- CHECK IF THERE'S A TRANSLATION KEY FOR THE CAST NAME --
  String nameKey = cast['nameKey'] ?? '';
  String name = cast['name'] ?? '';

  /// -- GET THE TRANSLATED NAME IF AVAILABLE --
  String displayName = nameKey.isNotEmpty ? nameKey.translate(context) : name;

  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Column(
      children: [
        /// -- CAST IMAGE --
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(cast['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: HMSizes.spaceBtwItems / 2 + 2),

        /// -- CAST NAME --
        SizedBox(
          width: 100,
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
