import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/search/controller/search_controller.dart';
import 'package:hmdb/screens/details/details_screen.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MovieSearchController>();
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive dimensions ---
    final double cardRadius = MediaQuery.of(context).size.width * 0.03;
    final double imageWidth = MediaQuery.of(context).size.width * 0.2;
    final double imageHeight = MediaQuery.of(context).size.height * 0.15;
    final double iconSize = MediaQuery.of(context).size.width * 0.04;
    final double customPadding = MediaQuery.of(context).size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text('search_results'.translate(context)),
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () {
            controller.clearSearch();
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (controller.searchQuery.isEmpty) {
          return Center(
            child: Text(
              'enter_search_query'.translate(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }

        if (controller.searchResults.isEmpty) {
          return Center(
            child: Text(
              'no_results_found'.translate(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(customPadding),
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            final movie = controller.searchResults[index];
            return _buildMovieListItem(context, movie, dark, cardRadius,
                imageWidth, imageHeight, iconSize);
          },
        );
      }),
    );
  }

  Widget _buildMovieListItem(
      BuildContext context,
      MovieModel movie,
      bool dark,
      double cardRadius,
      double imageWidth,
      double imageHeight,
      double iconSize) {
    final double customPadding = MediaQuery.of(context).size.width * 0.04;
    return Card(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
      elevation: 2,
      color: dark ? HMColors.darkerGrey : HMColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius)),
      child: InkWell(
        onTap: () {
          Get.to(() => DetailsScreen(movie: movie));
        },
        borderRadius: BorderRadius.circular(cardRadius),
        child: Row(
          children: [
            /// -- MOVIE POSTER --
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cardRadius),
                bottomLeft: Radius.circular(cardRadius),
              ),
              child: Image.asset(
                movie.imageAsset ?? '',
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),

            /// -- MOVIE INFO --
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(customPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.getTranslatedName(context),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: iconSize),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Text(
                          movie.movieRating ?? 'N/A',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Text(
                          movie.year ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    if (movie.movieTags != null && movie.movieTags!.isNotEmpty)
                      Wrap(
                        spacing: MediaQuery.of(context).size.width * 0.015,
                        runSpacing: MediaQuery.of(context).size.width * 0.015,
                        children: movie.movieTags!
                            .map((tag) => Chip(
                                  label: Text(
                                    tag
                                        .toString()
                                        .toLowerCase()
                                        .translate(context),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.025),
                                  ),
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                ))
                            .toList(),
                      ),
                  ],
                ),
              ),
            ),

            /// -- ARROW ICON --
            Padding(
              padding: EdgeInsets.all(customPadding * 0.5),
              child: Icon(
                Iconsax.arrow_right_3,
                color: dark ? HMColors.white : HMColors.black,
                size: iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
