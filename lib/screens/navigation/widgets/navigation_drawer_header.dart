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
              radius: 36,
              backgroundImage: currentImage.startsWith('assets')
                  ? AssetImage(currentImage)
                  : FileImage(File(currentImage)) as ImageProvider,
              backgroundColor: dark ? HMColors.darkerGrey : HMColors.lightGrey,
            );
          }),
          const SizedBox(height: 16),
          Text(
            "welcome_user"
                .translate(context)
                .replaceAll("{username}", username),
            style: TextStyle(
              color: dark ? HMColors.primary : HMColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
