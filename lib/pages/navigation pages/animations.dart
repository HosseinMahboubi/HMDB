import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/home/controllers/favorite_controller.dart';
import 'package:hmdb/pages/navigation%20pages/widgets/navigation_pages_gradient_overlay.dart';
import 'package:hmdb/pages/navigation%20pages/widgets/navigation_pages_movie_poster.dart';
import 'package:hmdb/screens/details/details_screen.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/navigation_pages_header.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive padding and spacing ---
    final double defaultPadding =
        MediaQuery.of(context).size.width * 0.06; // --- ~6% of screen width ---
    final double gridSpacing =
        MediaQuery.of(context).size.width * 0.04; // --- ~4% of screen width ---

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) return;

        /// -- NAVIGATE TO HOME PAGE --
        final navController = Get.find<NavigationController>();
        navController.changeIndex(0);
      },
      child: Scaffold(
        backgroundColor: dark ? HMColors.black : HMColors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- HEADER --
              HMNavigationPageHeader(
                dark: dark,
                text: 'animations'.translate(context),
                subText: "discover_the_best_animations".translate(context),
              ),

              /// -- MOVIE GRID --
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(defaultPadding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: gridSpacing,
                    mainAxisSpacing: gridSpacing,
                  ),
                  itemCount: animationImages.length,
                  itemBuilder: (context, index) {
                    final movie = animationImages[index];
                    return _buildMovieCard(context, movie);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, MovieModel movie) {
    final favoriteController = Get.put(FavoriteController());

    return GestureDetector(
      onTap: () {
        /// -- NAVIGATE TO MOVIE DETAILS --
        Get.to(() => DetailsScreen(movie: movie));
      },
      child: Stack(
        children: [
          /// -- MOVIE POSTER --
          HMNavigationPagesMoviePoster(
            image: AssetImage(movie.imageAsset!),
          ),

          /// -- GRADIENT OVERLAY --
          const HMNavigationPagesGradientOverlay(),

          /// -- ADD FAVORITE BUTTON --
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width *
                0.02, // --- ~2% of screen width ---
            child: GestureDetector(
              onTap: () {
                favoriteController.toggleFavorite(movie);
              },
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Obx(() => Icon(
                      favoriteController.isFavorite(movie)
                          ? Iconsax.heart5
                          : Iconsax.heart,
                      color: favoriteController.isFavorite(movie)
                          ? Colors.red
                          : Colors.white,
                      size: MediaQuery.of(context).size.width * 0.045,
                    )),
              ),
            ),
          ),

          /// -- MOVIE INFO --
          Positioned(
            bottom: MediaQuery.of(context).size.height *
                0.015, // --- ~1.5% of screen height ---
            left: MediaQuery.of(context).size.width *
                0.03, // --- ~3% of screen width ---
            right: MediaQuery.of(context).size.width *
                0.03, // --- ~3% of screen width ---
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.getTranslatedName(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width *
                        0.035, // --- ~3.5% of screen width ---
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ), // --- ~0.5% of screen height ---
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: MediaQuery.of(context).size.width *
                          0.04, // --- ~4% of screen width ---
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ), // --- ~1% of screen width ---
                    Text(
                      movie.movieRating ?? 'N/A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width *
                            0.03, // ~3% of screen width
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.02), // ~2% of screen width
                    Text(
                      movie.year ?? '',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: MediaQuery.of(context).size.width *
                            0.03, // ~3% of screen width
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
