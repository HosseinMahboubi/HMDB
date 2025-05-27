import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';

class HMCards_Movies_InformationContainer extends StatelessWidget {
  const HMCards_Movies_InformationContainer({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    /// -- RESPONSIVE DIMENSIONS --
    final double horizontalPadding =
        MediaQuery.of(context).size.width * 0.04; // --- ~4% of screen width ---
    final double fontSize = MediaQuery.of(context).size.width *
        0.035; // -- ~3.5% of screen width --

    return Positioned(
      left: horizontalPadding,
      right: horizontalPadding,
      bottom: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieModel.getTranslatedName(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: fontSize * 0.35),
                Text(
                  movieModel.year!,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: fontSize * 0.35),
              ],
            ),
          ),
          SizedBox(width: horizontalPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: fontSize * 1.15,
              ),
              SizedBox(width: fontSize * 0.15),
              Text(
                movieModel.movieRating!,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
