import 'package:flutter/material.dart';
import 'package:hmdb/commons/play_button.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/home/thumbnails/widgets/thumbnail_movies_image.dart';
import 'package:hmdb/pages/home/thumbnails/widgets/thumbnail_movies_info.dart';
import 'package:hmdb/screens/details/details_screen.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';

class CustomCardThumbnails extends StatelessWidget {
  final String imageAsset;
  final String movieName;
  final String year;
  final String rating;
  final MovieModel? movieModel;
  final String? movieTrailer;

  const CustomCardThumbnails({
    super.key,
    required this.imageAsset,
    this.movieName = "Unknown",
    this.year = "",
    this.rating = "",
    this.movieModel,
    this.movieTrailer,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive border radius ---
    final double borderRadius =
        MediaQuery.of(context).size.width * 0.04; // --- ~4% of screen width ---

    return GestureDetector(
      onTap: () {
        if (movieModel != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(movie: movieModel!),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: dark
                  ? Colors.black.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            children: [
              /// -- MOVIE IMAGE --
              HMThumbnailMovieImage(imageAsset: imageAsset),

              /// --- Gradient overlay ---
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),

              /// -- THUMBNAIL MOVIE INFO (NAME AND YEAR AND RATING) --
              HMThumbnailsMovieInfo(
                movieName: movieName,
                year: year,
                rating: rating,
              ),

              /// -- PLAY BUTTON --
              const HMPlayButton(),
            ],
          ),
        ),
      ),
    );
  }
}
