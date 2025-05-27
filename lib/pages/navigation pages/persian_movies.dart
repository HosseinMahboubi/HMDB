import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/home/controllers/favorite_controller.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/pages/navigation%20pages/widgets/navigation_pages_header.dart';
import 'package:hmdb/utils/constants/sizes.dart';
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
                  padding: const EdgeInsets.all(HMSizes.defaultSpace),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
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
    final dark = HMHelperFunction.isDarkMode(context);
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
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(movie.imageAsset!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),

          /// -- GRADIENT OVERLAY --
          const HMNavigationPagesGradientOverlay(),

          /// -- ADD FAVORITE BUTTON --
          Positioned(
            top: 0,
            left: 8,
            child: GestureDetector(
              onTap: () {
                favoriteController.toggleFavorite(movie);
              },
              child: Container(
                padding: const EdgeInsets.all(6),
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
                      size: 18,
                    )),
              ),
            ),
          ),

          /// -- MOVIE INFO --
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.getTranslatedName(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.movieRating ?? 'N/A',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      movie.year ?? '',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
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
