import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/home/widgets/custom_card_normal.dart';

Widget movieListBuilder(List<MovieModel> movieList) {
  return LayoutBuilder(
    builder: (context, constraints) {
      /// --- Responsive margin and height ---
      final double horizontalMargin = MediaQuery.of(context).size.width *
          0.05; // --- ~5% of screen width ---
      final double verticalMargin = MediaQuery.of(context).size.height *
          0.01; // --- ~1% of screen height ---
      final double containerHeight = MediaQuery.of(context).size.height *
          0.27; // --- 27% of screen height ---

      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin, vertical: verticalMargin),
        height: containerHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return CustomCardNormal(
              movieModel: movieList[index],
            );
          },
        ),
      );
    },
  );
}
