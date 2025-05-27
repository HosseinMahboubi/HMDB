import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/pages/navigation%20pages/widgets/navigation_pages_header.dart';
import 'package:hmdb/screens/details/details_screen.dart';
import 'package:hmdb/utils/constants/colors.dart';
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

    /// --- Responsive padding and spacing ---
    final double defaultPadding =
        MediaQuery.of(context).size.width * 0.06; // ~6% of screen width
    final double gridSpacing =
        MediaQuery.of(context).size.width * 0.04; // ~4% of screen width

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
                            size: MediaQuery.of(context).size.width *
                                0.16, // ~16% of screen width
                            color:
                                dark ? HMColors.lightGrey : HMColors.darkGrey,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.02), // ~2% of screen height
                          Text(
                            "no_favorites_yet".translate(context),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: dark ? HMColors.white : HMColors.black,
                                ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.01), // ~1% of screen height
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
                    padding: EdgeInsets.all(defaultPadding),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: gridSpacing,
                      mainAxisSpacing: gridSpacing,
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
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.03), // ~3% of screen width
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: MediaQuery.of(context).size.width *
                  0.02, // ~2% of screen width
              offset: Offset(
                  0,
                  MediaQuery.of(context).size.height *
                      0.002), // ~0.2% of screen height
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width *
                                0.03), // ~3% of screen width
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width *
                                0.03), // ~3% of screen width
                      ),
                      image: DecorationImage(
                        image: AssetImage(movie.imageAsset ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// -- FAVORITE BUTTON --
                  Positioned(
                    top: MediaQuery.of(context).size.height *
                        0.01, // ~1% of screen height
                    left: MediaQuery.of(context).size.width *
                        0.02, // ~2% of screen width
                    child: GestureDetector(
                      onTap: () {
                        controller.toggleFavorite(movie);
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width *
                                0.015), // ~1.5% of screen width
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.heart5,
                          color: Colors.red,
                          size: MediaQuery.of(context).size.width *
                              0.05, // ~5% of screen width
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// -- MOVIE INFO --
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                  0.02), // ~2% of screen width
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
                        movie.movieRating ?? "0.0",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  dark ? HMColors.lightGrey : HMColors.darkGrey,
                            ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.02), // ~2% of screen width
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
