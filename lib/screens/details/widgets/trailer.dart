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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "trailer".translate(context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
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
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: HMHelperFunction.isDarkMode(context)
                        ? Colors.white
                        : HMColors.primary,
                    size: 40,
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
