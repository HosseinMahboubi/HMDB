import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';

class MovieSearchController extends GetxController {
  /// -- LIST OF ALL MOVIES --
  final RxList<MovieModel> allMovies = <MovieModel>[].obs;

  /// -- LIST OF SEARCH RESULTS --
  final RxList<MovieModel> searchResults = <MovieModel>[].obs;

  /// -- SEARCH QUERY --
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();

    /// -- COMBINE ALL MOVIE LISTS --
    final combinedMovies = [
      ...popularImages,
      ...forYouImage,
      ...persianMovieImages,
      ...animationImages,
    ];

    allMovies.addAll(HMHelperFunction.removeDuplicates(combinedMovies));
  }

  /// -- SEARCH FUNCTION --
  void search(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    /// -- FILTER MOVIE BASED ON QUERY --
    final results = allMovies.where((movie) {
      final name = movie.movieName?.toLowerCase() ?? '';
      final year = movie.year?.toLowerCase() ?? '';
      final tags = movie.movieTags
              ?.map((tag) => tag.toString().toLowerCase())
              .join(' ') ??
          '';

      return name.contains(query.toLowerCase()) ||
          year.contains(query.toLowerCase()) ||
          tags.contains(query.toLowerCase());
    }).toList();

    searchResults.value = results;
  }

  /// -- CLEAR SEARCH RESULTS --
  void clearSearch() {
    searchQuery.value = '';
    searchResults.clear();
  }
}
