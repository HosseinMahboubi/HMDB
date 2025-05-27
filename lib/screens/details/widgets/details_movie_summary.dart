import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:readmore/readmore.dart';

class HMDetailsMovieSum extends StatelessWidget {
  const HMDetailsMovieSum({
    super.key,
    required this.isDark,
    this.movieSummary,
  });

  final bool isDark;
  final String? movieSummary;

  @override
  Widget build(BuildContext context) {
    /// --- Responsive dimensions ---
    final double verticalPadding =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height
    final double horizontalPadding =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: ReadMoreText(
        movieSummary!,
        trimLines: 3,
        trimMode: TrimMode.Line,
        moreStyle: TextStyle(
          color: isDark ? HMColors.buttonSecondary : HMColors.primary,
        ),
        lessStyle: TextStyle(
          color: isDark ? HMColors.buttonSecondary : HMColors.primary,
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white70 : HMColors.grey,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
