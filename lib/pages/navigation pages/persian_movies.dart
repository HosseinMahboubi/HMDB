import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/home/controllers/favorite_controller.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/pages/navigation%20pages/widgets/navigation_pages_header.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/details/details_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'widgets/navigation_pages_gradient_overlay.dart';

class PersianMoviesPage extends StatelessWidget {
  const PersianMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive padding and spacing ---
    final double defaultPadding =
        MediaQuery.of(context).size.width * 0.06; // ~6% of screen width
    final double gridSpacing =
        MediaQuery.of(context).size.width * 0.04; // ~4% of screen width

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) return;

        /// -- NAVIGATE BACK TO PREVIOUS PAGE --
        final NavigationController navController =
            Get.find<NavigationController>();
        navController.changeIndex(0);
      },
      child: Scaffold(
        backgroundColor: dark ? HMColors.black : HMColors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- HEADER --
              HMNavigationPageHeader(
                dark: dark,
                text: 'persian_movies'.translate(context),
                subText: 'discover_iranian_cinema'.translate(context),
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
                  itemCount: persianMovieImages.length,
                  itemBuilder: (context, index) {
                    final movie = persianMovieImages[index];
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width *
                      0.04), // ~4% of screen width
              image: DecorationImage(
                image: AssetImage(movie.imageAsset!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: MediaQuery.of(context).size.width *
                      0.025, // ~2.5% of screen width
                  offset: Offset(
                      0,
                      MediaQuery.of(context).size.height *
                          0.005), // ~0.5% of screen height
                ),
              ],
            ),
          ),

          /// -- GRADIENT OVERLAY --
          const HMNavigationPagesGradientOverlay(),

          /// -- ADD FAVORITE BUTTON --
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.01, // ~1% of screen height
            left:
                MediaQuery.of(context).size.width * 0.02, // ~2% of screen width
            child: GestureDetector(
              onTap: () {
                favoriteController.toggleFavorite(movie);
              },
              child: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                    0.015), // ~1.5% of screen width
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
                      size: MediaQuery.of(context).size.width *
                          0.045, // ~4.5% of screen width
                    )),
              ),
            ),
          ),

          /// -- MOVIE INFO --
          Positioned(
            bottom: MediaQuery.of(context).size.height *
                0.015, // ~1.5% of screen height
            left:
                MediaQuery.of(context).size.width * 0.03, // ~3% of screen width
            right:
                MediaQuery.of(context).size.width * 0.03, // ~3% of screen width
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
                        0.035, // ~3.5% of screen width
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.005), // ~0.5% of screen height
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: MediaQuery.of(context).size.width *
                          0.04, // ~4% of screen width
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.01), // ~1% of screen width
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
