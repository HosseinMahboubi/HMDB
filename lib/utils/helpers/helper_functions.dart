import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HMHelperFunction {
  /// ================ CHECK IF THE APP IS CURRENTLY IN DARK MODE ================

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// ================ GET THE FULL DIMENSIONS OF THE SCREEN ================

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// ================ GETS JUST THE HEIGHT OF THE SCREEN ================

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// ================ GETS JUST THE WIDTH OF THE SCREEN ================

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// ================ REMOVE REPEATED ITEMS FROM A LIST ================

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }
}
