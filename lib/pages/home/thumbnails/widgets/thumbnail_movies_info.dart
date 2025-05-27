import 'package:flutter/material.dart';

class HMThumbnailsMovieInfo extends StatelessWidget {
  const HMThumbnailsMovieInfo({
    super.key,
    required this.movieName,
    required this.year,
    required this.rating,
  });

  final String movieName;
  final String year;
  final String rating;

  @override
  Widget build(BuildContext context) {
    /// --- Responsive padding ---
    final double horizontalPadding =
        MediaQuery.of(context).size.width * 0.04; // ~4% of screen width

    return Positioned(
      bottom: 0,
      left: horizontalPadding,
      right: horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: const Offset(0, 1),
                  blurRadius: 2.0,
                  color: Colors.black.withOpacity(0.7),
                ),
              ],
            ),
          ),
          Text(
            "${year.isNotEmpty ? "$year • " : ""}${rating.isNotEmpty ? "$rating/10" : ""}",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  offset: const Offset(0, 1),
                  blurRadius: 2.0,
                  color: Colors.black.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
