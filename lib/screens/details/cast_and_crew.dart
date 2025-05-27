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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "cast".translate(context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
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
