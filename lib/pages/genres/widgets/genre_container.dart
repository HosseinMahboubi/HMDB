import 'package:flutter/material.dart';

class HMGenreContainer extends StatelessWidget {
  const HMGenreContainer({
    super.key,
    required this.isDark,
    required this.genreColor,
    required this.imageAsset,
  });

  final bool isDark;
  final Color genreColor;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    /// -- CALCULATE RESPONSIVE --
    final double containerWidth =
        MediaQuery.of(context).size.width * 0.6; // --- ~60% of screen width ---
    final double borderRadius =
        containerWidth * 0.1; // --- Proportional border radius ---

    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width *
            0.025, // --- ~2.5% of screen width ---
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            borderRadius * 0.72), // --- Adjusted for inner gradient ---
        gradient: LinearGradient(
          colors: [
            genreColor.withOpacity(isDark ? 0.8 : 0.9),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
