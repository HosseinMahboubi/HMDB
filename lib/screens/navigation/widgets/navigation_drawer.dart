import 'package:flutter/material.dart';
import 'package:hmdb/pages/navigation%20pages/profile.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/screens/navigation/widgets/navigation_build_drawer_item.dart';
import 'package:hmdb/screens/navigation/widgets/navigation_drawer_header.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';

class HMNavigationDrawer extends StatelessWidget {
  const HMNavigationDrawer({
    super.key,
    required this.username,
    required this.controller,
    required this.profileController,
    required this.dark,
  });

  /// ======== VARIABLES ========
  final String username;
  final NavigationController controller;
  final ProfileController profileController;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: dark ? HMColors.black : HMColors.white,

      /// -- SCROLLABLE LIST --
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /// -- DRAWER HEADER --
          HMNavigationDrawerHeader(
            dark: dark,
            profileController: profileController,
            username: username,
          ),

          /// -- BUILD DRAWER ITEMS --
          HMNavigationBuildDrawerItem(
            context: context,
            icon: Iconsax.home_1,
            label: 'home'.translate(context),
            index: 0,
            controller: controller,
            dark: dark,
          ),
          HMNavigationBuildDrawerItem(
            context: context,
            icon: Iconsax.category,
            label: 'genres'.translate(context),
            index: 1,
            controller: controller,
            dark: dark,
          ),
          HMNavigationBuildDrawerItem(
            context: context,
            icon: Iconsax.star1,
            label: 'imdb_top_250'.translate(context),
            index: 2,
            controller: controller,
            dark: dark,
          ),
          HMNavigationBuildDrawerItem(
            context: context,
            icon: Iconsax.video,
            label: 'persian_movies'.translate(context),
            index: 3,
            controller: controller,
            dark: dark,
          ),
          HMNavigationBuildDrawerItem(
            context: context,
            icon: Iconsax.emoji_happy,
            label: 'animations'.translate(context),
            index: 4,
            controller: controller,
            dark: dark,
          ),
          HMNavigationBuildDrawerItem(
            context: context,
            icon: Iconsax.heart,
            label: 'favorite'.translate(context),
            index: 5,
            controller: controller,
            dark: dark,
          ),
          HMNavigationBuildDrawerItem(
            context: context,
            icon: Iconsax.user,
            label: 'profile'.translate(context),
            index: 6,
            controller: controller,
            dark: dark,
          ),
        ],
      ),
    );
  }
}
