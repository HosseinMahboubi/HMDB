import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:get/get.dart';
import '../controller/details_controller.dart';

class HMDownloadWatchButton extends StatelessWidget {
  final String text;
  final MovieModel movie;

  const HMDownloadWatchButton({
    super.key,
    required this.text,
    required this.movie,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive dimensions ---
    final double paddingVertical =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height
    final double paddingHorizontal =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double blurRadius =
        MediaQuery.of(context).size.width * 0.03; // ~3% of screen width

    /// -- INITIALIZE THE CONTROLLER --
    final DetailsController controller = Get.find<DetailsController>(tag: tag);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        decoration: BoxDecoration(
          color: dark ? HMColors.darkerGrey : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(HMSizes.cardRadiusLg),
            topRight: Radius.circular(HMSizes.cardRadiusLg),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: blurRadius,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => controller.watchMovie(context),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(HMSizes.md),
            backgroundColor: HMColors.primary,
            side: BorderSide.none,
          ),
          child: Text(
            text.translate(context),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: HMColors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
