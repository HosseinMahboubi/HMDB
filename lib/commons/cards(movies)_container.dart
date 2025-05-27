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
    return Container(
      height: 200,
      width: 200,
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
