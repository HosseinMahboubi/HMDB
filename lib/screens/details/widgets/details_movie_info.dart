import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/constants/colors.dart';

class HMDetailsMovieInfo extends StatelessWidget {
  const HMDetailsMovieInfo({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    /// --- Responsive dimensions ---
    final double bottomPosition =
        MediaQuery.of(context).size.height * 0.03; // ~3% of screen height
    final double sideMargin =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double iconSize =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double spacing =
        MediaQuery.of(context).size.width * 0.025; // ~2.5% of screen width

    return Positioned(
      bottom: bottomPosition,
      left: sideMargin,
      right: sideMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// -- MOVIE NAME --
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: Text(
              movie.getTranslatedName(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: HMColors.white,
                  ),
            ),
          ),

          /// -- MOVIE RATING --
          Row(
            children: [
              Text(
                movie.movieRating ?? "0.0",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: HMColors.white,
                    ),
              ),
              SizedBox(width: spacing),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: iconSize,
              ),
            ],
          )
        ],
      ),
    );
  }
}
