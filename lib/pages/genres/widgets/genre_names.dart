import 'package:flutter/material.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class HMGenreName extends StatelessWidget {
  const HMGenreName({
    super.key,
    required this.genreName,
  });

  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 20,
      child: Text(
        genreName.translate(context),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: const Offset(0, 1),
              blurRadius: 3.0,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
