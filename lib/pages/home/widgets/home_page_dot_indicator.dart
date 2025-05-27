import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';

class HMHomePageIndicator extends StatelessWidget {
  const HMHomePageIndicator({
    super.key,
    required this.movieList,
    required this.currentPage,
  });

  /// ====== VARIABLES ========

  /// -- TAKES A LIST OF MOVIES --
  final List<MovieModel> movieList;

  /// -- CURRENT PAGE INDEX --
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        movieList.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 8,
          width: currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
