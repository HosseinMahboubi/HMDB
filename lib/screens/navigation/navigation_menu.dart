import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/pages/navigation%20pages/profile.dart';
import 'package:hmdb/pages/genres/genres.dart';
import 'package:hmdb/pages/home/home.dart';
import 'package:hmdb/pages/navigation%20pages/animations.dart';
import 'package:hmdb/pages/navigation%20pages/favorite.dart';
import 'package:hmdb/pages/navigation%20pages/imdb_top250.dart';
import 'package:hmdb/pages/navigation%20pages/persian_movies.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:hmdb/screens/navigation/widgets/navigation_drawer.dart';

class NavigationMenu extends StatelessWidget {
  final String username;

  const NavigationMenu({
    super.key,
    this.username = "Admin",
  });

  @override
  Widget build(BuildContext context) {
    /// -- KEEPS TRACK OF WHICH PAGE IS SELECTED --
    final controller = Get.put(NavigationController());

    /// -- MANAGE THE USER'S PROFILE PICTURE --
    final profileController = Get.put(ProfileController());

    final dark = HMHelperFunction.isDarkMode(context);

    return Scaffold(
      /// -- NAVIGATION DRAWER --
      drawer: HMNavigationDrawer(
        username: username,
        controller: controller,
        profileController: profileController,
        dark: dark,
      ),

      /// -- APPBAR --
      appBar: AppBar(
        title: Text(
          'app_name'.translate(context),
          style: Theme.of(context).textTheme.headlineSmall?.apply(
                color: dark ? HMColors.primary : HMColors.white,
              ),
        ),
        backgroundColor: dark ? HMColors.black : HMColors.primary,
        iconTheme: IconThemeData(
          color: dark ? HMColors.primary : HMColors.white,
        ),
        elevation: 0,
      ),

      /// -- MAIN CONTENT AREA AUTOMATICALLY UPDATED --
      body: Obx(() => _getScreens()[controller.selectedIndex.value]),
    );
  }

  /// -- DEFINE SCREENS LIST AS A METHOD --
  List<Widget> _getScreens() {
    return [
      const HomeScreen(),
      const GenrePage(),
      const IMDBTop250Page(),
      const PersianMoviesPage(),
      const AnimationsPage(),
      const FavoritePage(),
      const ProfilePage(),
    ];
  }
}
