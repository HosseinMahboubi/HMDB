import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/commons/cards(movies)_container.dart';
import 'package:hmdb/commons/cards(movies)_information_container.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/screens/details/details_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hmdb/pages/home/controllers/favorite_controller.dart';

class CustomCardNormal extends StatelessWidget {
  const CustomCardNormal({
    super.key,
    required this.movieModel,
  });

  /// =============== VARIABLES ================
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE CONTROLLER --
    /// --- Favorite means Heart Icon ---
    final favoriteController = Get.put(FavoriteController());

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movie: movieModel),
          ),
        );
      },
      child: Stack(
        children: [
          /// -- MOVIE CARDS CONTAINER --
          HMCards_Movies_Container(movieModel: movieModel),

          /// -- MOVIE CARDS INFORMATION --
          HMCards_Movies_InformationContainer(movieModel: movieModel),

          /// -- ADD FAVORITE HEART BUTTON --
          Positioned(
            top: 0,
            left: 15,
            child: GestureDetector(
              onTap: () {
                favoriteController.toggleFavorite(movieModel);
              },
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
          ),
        ],
      ),
    );
  }
}
