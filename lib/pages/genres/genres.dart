import 'package:flutter/material.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- List of genre names, their colors, and movie images ---
    final List<Map<String, dynamic>> genres = [
      {
        'name': 'action'.translate(context),
        'color': Colors.red[700],
        'image': popularImages[2].imageAsset,
      },
      {
        'name': 'drama'.translate(context),
        'color': Colors.indigo[700],
        'image': forYouImage[0].imageAsset,
      },
      {
        'name': 'mystery'.translate(context),
        'color': Colors.deepPurple[700],
        'image': forYouImage[1].imageAsset,
      },
      {
        'name': 'horror'.translate(context),
        'color': Colors.black87,
        'image': genresList[0].imageAsset,
      },
      {
        'name': 'comedy'.translate(context),
        'color': Colors.orange[600],
        'image': genresList[2].imageAsset,
      },
      {
        'name': 'romance'.translate(context),
        'color': Colors.pink[400],
        'image': genresPage[0].imageAsset,
      },
      {
        'name': 'sci-fi'.translate(context),
        'color': Colors.blue[700],
        'image': genresPage[1].imageAsset,
      },
      {
        'name': 'series'.translate(context),
        'color': Colors.teal[800],
        'image': genresPage[2].imageAsset,
      },
    ];

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) return;

        /// --- Navigate back to the navigation menu with home tab selected ---
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
              Padding(
                padding: const EdgeInsets.all(HMSizes.defaultSpace),
                child: Text(
                  'movie_genres'.translate(context),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: dark ? HMColors.white : HMColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

              /// -- SUBTITLE --
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: HMSizes.defaultSpace,
                ),
                child: Text(
                  'explore_genres'.translate(context),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: dark ? HMColors.lightGrey : HMColors.darkGrey,
                      ),
                ),
              ),

              const SizedBox(height: HMSizes.spaceBtwSections),

              /// -- GENRE GRID --
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(HMSizes.defaultSpace),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          /// -- IN FUTURE, ADD MOVIES BASED ON GENRES --
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            /// --- Movie image ---
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                genres[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),

                            /// -- GRADIANT OVERLAY --
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    genres[index]['color']!.withOpacity(0.8),
                                  ],
                                ),
                              ),
                            ),

                            /// --- GENRE NAME ---
                            Positioned(
                              bottom: 16,
                              left: 16,
                              child: Text(
                                genres[index]['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
