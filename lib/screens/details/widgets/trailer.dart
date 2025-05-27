import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:get/get.dart';
import '../controller/details_controller.dart';

import '../../../utils/constants/sizes.dart';

class HMTrailer extends StatelessWidget {
  const HMTrailer({
    super.key,
    required this.movie,
    required this.tag,
  });

  final MovieModel movie;
  final String tag;

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLER --
    final DetailsController controller = Get.find<DetailsController>(tag: tag);

    /// --- Responsive dimensions ---
    final double verticalPadding =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height
    final double horizontalPadding =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double thumbnailHeight =
        MediaQuery.of(context).size.height * 0.25; // ~25% of screen height
    final double borderRadius =
        MediaQuery.of(context).size.width * 0.03; // ~3% of screen width
    final double iconSize =
        MediaQuery.of(context).size.width * 0.1; // ~10% of screen width

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "trailer".translate(context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: MediaQuery.of(context).size.width *
                      0.05, // ~5% of screen width
                  fontWeight: FontWeight.w500,
                ),
          ),

          /// -- THUMBNAILS OVER EACH OTHER --
          const SizedBox(height: HMSizes.defaultSpace),
          GestureDetector(
            onTap: () => controller.launchTrailer(context),
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// --- Trailer thumbnail image ---
                Container(
                  height: thumbnailHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    image: DecorationImage(
                      image: AssetImage(
                        movie.movieTrailer ?? "assets/images/main/trailer.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// -- PLAY BUTTON OVERLAY --
                Container(
                  padding: EdgeInsets.all(iconSize * 0.4), // ~40% of icon size
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: HMHelperFunction.isDarkMode(context)
                        ? Colors.white
                        : HMColors.primary,
                    size: iconSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
