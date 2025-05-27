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

    return Container(
      height: cardHeight,
      width: cardWidth,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.025,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 6),
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
