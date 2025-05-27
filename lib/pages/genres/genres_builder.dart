import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/genres/widgets/genre_container.dart';
import 'package:hmdb/pages/genres/widgets/genre_names.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

Widget genresBuilder(List<MovieModel> genreList) {
  return Container(
    height: 200,
    margin: const EdgeInsets.symmetric(
      horizontal: 30,
    ),
    child: ListView.builder(
      itemCount: genreList.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        const Color genreColor = Colors.black87;

        /// --- Get the translated genre name ---
        final String originalName = genreList[index].movieName!;
        final String translationKey =
            originalName.toLowerCase().replaceAll(' ', '_');
        final String translatedGenreName = translationKey.translate(context);

        final bool isDark = HMHelperFunction.isDarkMode(context);

        return GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              /// -- GENRE CONTAINER --
              HMGenreContainer(
                isDark: isDark,
                genreColor: genreColor,
                imageAsset: genreList[index].imageAsset.toString(),
              ),

              /// -- GENRE NAME --
              HMGenreName(
                genreName: translatedGenreName,
              ),
            ],
          ),
        );
      },
    ),
  );
}
