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
    /// --- Responsive dimensions ---
    final double dotHeight = MediaQuery.of(context).size.height *
        0.01; // --- ~1% of screen height ---
    final double activeDotWidth =
        MediaQuery.of(context).size.width * 0.06; // --- ~6% of screen width ---
    final double inactiveDotWidth = dotHeight;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        movieList.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.005),
          height: dotHeight,
          width: currentPage == index ? activeDotWidth : inactiveDotWidth,
          decoration: BoxDecoration(
            color: currentPage == index
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(dotHeight / 2),
          ),
        ),
      ),
    );
  }
}
