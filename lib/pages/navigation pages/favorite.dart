import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/pages/navigation%20pages/widgets/navigation_pages_header.dart';
import 'package:hmdb/screens/details/details_screen.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hmdb/pages/home/controllers/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);
    final controller = Get.put(FavoriteController());

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        // Navigate to home page
        final navController = Get.find<NavigationController>();
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
                text: 'my_favorite'.translate(context),
                subText: "movies_and_shows_you've_added_to_favorites"
                    .translate(context),
              ),

              /// -- FAVORITE LIST --
              Expanded(
                child: Obx(() {
                  if (controller.favoriteMovies.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.heart,
                            size: 64,
                            color:
                                dark ? HMColors.lightGrey : HMColors.darkGrey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "no_favorites_yet".translate(context),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: dark ? HMColors.white : HMColors.black,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "add_movies_to_your_favorite_to_see_them_here"
                                .translate(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: dark
                                      ? HMColors.lightGrey
                                      : HMColors.darkGrey,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(HMSizes.defaultSpace),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: controller.favoriteMovies.length,
                    itemBuilder: (context, index) {
                      final movie = controller.favoriteMovies[index];
                      return _buildMovieCard(context, movie, controller);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieCard(
      BuildContext context, MovieModel movie, FavoriteController controller) {
    final dark = HMHelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsScreen(movie: movie));
      },
      child: Container(
        decoration: BoxDecoration(
          color: dark ? HMColors.darkerGrey : HMColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- MOVIE POSTER --
            Expanded(
              child: Stack(
                children: [
                  /// --- Movie image ---
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: AssetImage(movie.imageAsset ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// -- FAVORITE BUTTON --
                  Positioned(
                    top: 8,
                    left: 8,
                    child: GestureDetector(
                      onTap: () {
                        controller.toggleFavorite(movie);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.heart5,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// -- MOVIE INFO --
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.getTranslatedName(context),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: dark ? HMColors.white : HMColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                        movie.movieRating ?? "0.0",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  dark ? HMColors.lightGrey : HMColors.darkGrey,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        movie.year ?? "",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  dark ? HMColors.lightGrey : HMColors.darkGrey,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
