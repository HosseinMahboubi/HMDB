import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/pages/search/controller/search_controller.dart';
import 'package:hmdb/data/movies.dart';
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
          padding: const EdgeInsets.all(16),
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            final movie = controller.searchResults[index];
            return _buildMovieListItem(context, movie, dark);
          },
        );
      }),
    );
  }

  Widget _buildMovieListItem(
      BuildContext context, MovieModel movie, bool dark) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      color: dark ? HMColors.darkerGrey : HMColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Get.to(() => DetailsScreen(movie: movie));
        },
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            /// -- MOVIE POSTER --
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                movie.imageAsset ?? '',
                width: 80,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),

            /// -- MOVIE INFO --
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
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
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          movie.movieRating ?? 'N/A',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          movie.year ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (movie.movieTags != null && movie.movieTags!.isNotEmpty)
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: movie.movieTags!
                            .map((tag) => Chip(
                                  label: Text(
                                    tag
                                        .toString()
                                        .toLowerCase()
                                        .translate(context),
                                    style: const TextStyle(fontSize: 10),
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
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Iconsax.arrow_right_3,
                color: dark ? HMColors.white : HMColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
