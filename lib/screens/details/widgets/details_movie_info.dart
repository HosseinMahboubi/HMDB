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
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
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
              const SizedBox(width: 10),
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
