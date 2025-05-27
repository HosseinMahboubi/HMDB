import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/local_storage/storage_utility.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find<FavoriteController>();

  /// -- STATE => USED BY ANY PAGE NEEDING FAVORITE INFO --
  RxList<MovieModel> favoriteMovies = <MovieModel>[].obs;

  /// -- CALLED WHEN CONTROLLER IS CREATED --
  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  /// -- USED FOR LOADING/SAVING FAVORITES --
  void loadFavorites() {
    try {
      final dynamic savedData = HMLocalStorage().readData('favorite_movies');
      if (savedData != null) {
        List<String> savedMovieNames = [];
        if (savedData is List) {
          savedMovieNames = savedData.map((item) => item.toString()).toList();
        }
        if (savedMovieNames.isNotEmpty) {
          for (String name in savedMovieNames) {
            final movie = findMovieByName(name);
            if (movie != null) {
              favoriteMovies.add(movie);
            }
          }
        }
      }
    } catch (e) {
      /// --- Error Handling ---
    }
  }

  void saveFavorites() {
    try {
      final List<String> favoriteNames =
          favoriteMovies.map((movie) => movie.movieName.toString()).toList();
      HMLocalStorage().saveData('favorite_movies', favoriteNames);
    } catch (e) {
      /// --- Error Handling ---
    }
  }

  /// -- FAVORITE ACTIONS --
  void toggleFavorite(MovieModel movie) {
    if (isFavorite(movie)) {
      favoriteMovies.remove(movie);
    } else {
      favoriteMovies.add(movie);
    }
    saveFavorites();
  }

  bool isFavorite(MovieModel movie) {
    return favoriteMovies.any((m) => m.movieName == movie.movieName);
  }

  /// -- HELPER => USED INTERNALLY FOR LOADING PAGES FOR FAVORITE --
  MovieModel? findMovieByName(String name) {
    final allMovies = [
      ...popularImages,
      ...forYouImage,
      ...persianMovieImages,
      ...animationImages,
    ];
    try {
      return allMovies.firstWhere((movie) => movie.movieName == name);
    } catch (e) {
      return null;
    }
  }
}
