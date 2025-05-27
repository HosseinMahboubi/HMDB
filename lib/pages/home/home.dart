import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/pages/search/search_bar.dart';
import 'package:hmdb/commons/text_above_layouts.dart';
import 'package:hmdb/pages/home/widgets/top_container.dart';
import 'package:hmdb/pages/genres/genres.dart';
import 'package:hmdb/pages/genres/genres_builder.dart';
import 'package:hmdb/pages/home/widgets/for_you_card_layout.dart';
import 'package:hmdb/pages/home/widgets/movie_list_builder.dart';
import 'package:hmdb/pages/navigation%20pages/imdb_top250.dart';
import 'package:hmdb/pages/navigation%20pages/persian_movies.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import '../../utils/constants/colors.dart';
import '../navigation pages/animations.dart';
import 'controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({
    super.key,
    this.username = "Admin", // --- Default value if not provided ---
  });

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE CONTROLLER --
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Stack(
        children: [
          /// --- For Items ---
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- TOP CONTAINER --
                  const HMTopContainer(),
                  // const SizedBox(height: HMSizes.defaultSpace / 3),

                  /// -- SEARCH BAR --
                  const HMSearchBar(),
                  const SizedBox(height: HMSizes.spaceBtwItems),

                  /// -- PERSONAL OFFERS --
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      "personal_preference".translate(context),
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: HMHelperFunction.isDarkMode(context)
                                    ? HMColors.textSecondary
                                    : HMColors.darkGrey,
                              ),
                    ),
                  ),
                  const SizedBox(height: HMSizes.spaceBtwSections),

                  /// --- PERSONAL SECTION LAYOUTS ---
                  Obx(
                    () => ForYouCardLayout(
                        movieList: controller.forYouItemsList.toList()),
                  ),

                  const SizedBox(height: HMSizes.spaceBtwSections),

                  /// -- YOU CAN ADD MORE SECTIONS HERE --️ ⭐

                  /// -- POPULAR MOVIES --
                  HMAboveLayoutTexts(
                    text: 'popular_movies'.translate(context),
                    onPressed: () => Get.to(
                      () => const IMDBTop250Page(),
                    ),
                  ),
                  Obx(() =>
                      movieListBuilder(controller.popularItemsList.toList())),

                  /// -- PERSIANS --
                  HMAboveLayoutTexts(
                    text: 'persian_movies'.translate(context),
                    onPressed: () => Get.to(
                      () => const PersianMoviesPage(),
                    ),
                  ),
                  Obx(() => movieListBuilder(
                      controller.persianMovieItemList.toList())),

                  /// -- ANIMATION --
                  HMAboveLayoutTexts(
                    text: 'animations'.translate(context),
                    onPressed: () => Get.to(
                      () => const AnimationsPage(),
                    ),
                  ),
                  Obx(() =>
                      movieListBuilder(controller.animationItemList.toList())),

                  /// -- GENRES --
                  HMAboveLayoutTexts(
                    text: 'genres'.translate(context),
                    onPressed: () => Get.to(
                      () => const GenrePage(),
                    ),
                  ),
                  Obx(() => genresBuilder(controller.genreItemList.toList())),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
