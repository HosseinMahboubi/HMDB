import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/pages/home/controllers/favorite_controller.dart';
import 'package:iconsax/iconsax.dart';
import '../data/movies.dart';

class HMFavoriteHeartButton extends StatelessWidget {
  const HMFavoriteHeartButton({
    super.key,
    required this.favoriteController,
    required this.movieModel,
    required this.top,
    required this.right,
    required this.onTap,
    this.left,
  });

  final FavoriteController favoriteController;
  final MovieModel movieModel;
  final dynamic top;
  final dynamic right;
  final dynamic left;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left ?? 8,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: Obx(
            () => Icon(
              favoriteController.isFavorite(movieModel)
                  ? Iconsax.heart5
                  : Iconsax.heart,
              color: favoriteController.isFavorite(movieModel)
                  ? Colors.red
                  : Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
