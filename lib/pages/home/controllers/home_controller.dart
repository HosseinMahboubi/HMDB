import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';

class HomeController extends GetxController {
  /// --- ForYou carousel controller and state ---
  late PageController forYouPageController;
  final RxInt forYouCurrentPage = 0.obs;
  final RxList<MovieModel> forYouItemsList =
      List<MovieModel>.of(forYouImage).obs;

  /// --- Other movie lists ---
  final RxList<MovieModel> popularItemsList =
      List<MovieModel>.of(popularImages).obs;
  final RxList<MovieModel> genreItemList = List<MovieModel>.of(genresList).obs;
  final RxList<MovieModel> persianMovieItemList =
      List<MovieModel>.of(persianMovieImages).obs;
  final RxList<MovieModel> animationItemList =
      List<MovieModel>.of(animationImages).obs;

  @override
  void onInit() {
    super.onInit();
    forYouPageController =
        PageController(initialPage: 0, viewportFraction: 0.9);
  }

  @override
  void onClose() {
    forYouPageController.dispose();
    super.onClose();
  }

  /// --- ForYou carousel page change handler ---
  void changeForYouPage(int page) {
    forYouCurrentPage.value = page;
  }
}
