import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';

class HMCards_Movies_Container extends StatelessWidget {
  const HMCards_Movies_Container({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    /// --- Responsive width: about 45% of screen width ---
    final double cardWidth = MediaQuery.of(context).size.width * 0.45;
    final double cardHeight = cardWidth;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: cardHeight,
      width: cardWidth,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.5),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.0, 0.4, 0.8],
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.025,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: isDark 
                ? Colors.black.withOpacity(0.5) 
                : Colors.grey.withOpacity(0.4),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(movieModel.imageAsset!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
