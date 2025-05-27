import 'package:flutter/material.dart';
import 'package:hmdb/screens/details/widgets/cast_card.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class CastAndCrew extends StatelessWidget {
  const CastAndCrew({
    super.key,
    required this.casts,
  });

  final List casts;

  @override
  Widget build(BuildContext context) {
    /// --- Responsive dimensions ---
    final double verticalPadding =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height
    final double horizontalPadding =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double listHeight =
        MediaQuery.of(context).size.height * 0.2; // ~20% of screen height
    final double fontSize =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "cast".translate(context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: verticalPadding),
          SizedBox(
            height: listHeight,
            child: ListView.builder(
              itemCount: casts.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return castCard(casts[index], context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
