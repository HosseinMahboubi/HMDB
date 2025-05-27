import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/home/controllers/home_controller.dart';
import 'package:hmdb/pages/home/thumbnails/custom_card_thumbnails.dart';
import 'package:hmdb/pages/home/widgets/home_page_dot_indicator.dart';
import 'package:hmdb/utils/constants/sizes.dart';

class ForYouCardLayout extends StatelessWidget {
  /// -- A LIST OF MOVIE TO DISPLAY --
  final List<MovieModel> movieList;

  const ForYouCardLayout({
    super.key,
    required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLER --
    final HomeController controller = Get.find<HomeController>();

    return Column(
      children: [
        SizedBox(
          height:
              MediaQuery.of(context).size.height * 0.4, // -- 40% of Height --

          child: PageView.builder(
            /// --- Default Behavior of Android ---
            physics: const ClampingScrollPhysics(),
            controller: controller.forYouPageController,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              final movie = movieList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CustomCardThumbnails(
                  imageAsset: movie.imageAsset.toString(),
                  movieName: movie.getTranslatedName(context),
                  // year: movie.year ?? "",
                  rating: movie.movieRating ?? "",
                  movieTrailer: movie.movieTrailer,

                  /// -- PASS THE FULL MOVIE MODEL --
                  movieModel: movie,
                ),
              );
            },
            onPageChanged: (int page) {
              controller.changeForYouPage(page);
            },
          ),
        ),
        const SizedBox(height: HMSizes.spaceBtwItems),

        /// -- PAGE INDICATOR DOTS --
        Obx(() => HMHomePageIndicator(
              movieList: movieList,
              currentPage: controller.forYouCurrentPage.value,
            )),
      ],
    );
  }
}
