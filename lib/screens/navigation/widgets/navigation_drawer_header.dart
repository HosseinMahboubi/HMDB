import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/pages/navigation%20pages/profile.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class HMNavigationDrawerHeader extends StatelessWidget {
  const HMNavigationDrawerHeader({
    super.key,
    required this.dark,
    required this.profileController,
    required this.username,
  });

  /// ======== VARIABLES ========

  final bool dark;
  final ProfileController profileController;
  final String username;

  @override
  Widget build(BuildContext context) {
    /// --- Responsive dimensions ---
    final double avatarRadius =
        MediaQuery.of(context).size.width * 0.1; // ~10% of screen width
    final double fontSize =
        MediaQuery.of(context).size.width * 0.055; // ~5.5% of screen width
    final double spacing =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height

    return DrawerHeader(
      decoration: BoxDecoration(
        color: dark ? HMColors.black : HMColors.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            final currentImage = profileController.profileImage.value;
            return CircleAvatar(
              radius: avatarRadius,
              backgroundImage: currentImage.startsWith('assets')
                  ? AssetImage(currentImage)
                  : FileImage(File(currentImage)) as ImageProvider,
              backgroundColor: dark ? HMColors.darkerGrey : HMColors.lightGrey,
            );
          }),
          SizedBox(height: spacing),
          Text(
            "welcome_user"
                .translate(context)
                .replaceAll("{username}", username),
            style: TextStyle(
              color: dark ? HMColors.primary : HMColors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
