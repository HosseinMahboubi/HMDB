import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/pages/home/widgets/custom_card_normal.dart';

Widget movieListBuilder(List<MovieModel> movieList) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    height: 200,

    /// ================= OPTIONAL HEIGHTS =============
    // height: MediaQuery.of(context).size.height * 0.27,
    // height: HMSizes.imageCarouselHeight,
    /// ============== OPTIONAL HEIGHTS ================
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
}
