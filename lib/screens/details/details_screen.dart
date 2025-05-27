import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/screens/details/cast_and_crew.dart';
import 'package:hmdb/screens/details/controller/details_controller.dart';
import 'package:hmdb/screens/details/widgets/close_button.dart';
import 'package:hmdb/screens/details/widgets/comment%20section/comment.dart';
import 'package:hmdb/screens/details/widgets/details_movie_info.dart';
import 'package:hmdb/screens/details/widgets/details_movie_summary.dart';
import 'package:hmdb/screens/details/widgets/download(watch)_button.dart';
import 'package:hmdb/screens/details/widgets/trailer.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
  });

  /// ======== VARIABLES ===========

  /// --- Stores the movie that will be shown on this screen ---
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final isDark = HMHelperFunction.isDarkMode(context);

    /// -- INITIALIZE THE CONTROLLER --
    final controller = Get.put(
      DetailsController(movie: movie),
      tag: movie.movieName ?? movie.hashCode.toString(),
    );

    return Scaffold(
      body: Container(
        color: isDark ? Colors.transparent : HMColors.lightContainer,
        child: Stack(
          children: [
            /// -- THE BACKGROUND --
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      /// --- Movie poster image with gradient ---
                      Container(
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                            colors: [
                              HMColors.blackBackGround.withOpacity(0.8),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              controller.movie.imageAsset.toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      /// ---- Movie name, year and rating ---
                      HMDetailsMovieInfo(movie: controller.movie),
                    ],
                  ),
                  const SizedBox(height: HMSizes.spaceBtwInputFields),

                  /// --- Holds the rest of the movie details ---
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: HMSizes.defaultSpace),

                        /// -- DISPLAY THE MOVIE'S TAGS (IN A WRAPPED LAYOUT) --
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.buildMovieTags(context),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: HMSizes.spaceBtwItems),

                        /// -- MOVIE DETAILS SUMMARY --
                        HMDetailsMovieSum(
                          isDark: isDark,
                          movieSummary:
                              controller.movie.getTranslatedSummary(context),
                        ),

                        /// -- TRAILER SECTION --
                        HMTrailer(
                          movie: controller.movie,
                          tag: movie.movieName ?? movie.hashCode.toString(),
                        ),

                        /// -- CASTS --
                        CastAndCrew(
                          casts: controller.movie.cast ?? [],
                        ),

                        /// -- COMMENTS --
                        const HMComment(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- CLOSE BUTTON --
            const HMCloseButton(),

            /// -- DOWNLOAD (WATCH) MOVIE --
            HMDownloadWatchButton(
              text: 'watch'.translate(context),
              movie: controller.movie,
              tag: movie.movieName ?? movie.hashCode.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
