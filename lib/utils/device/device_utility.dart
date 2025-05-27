import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HMDeviceUtils {
  /// ================ CLOSE THE KEYBOARD ================

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// ================ CHANGE THE COLOR OF STATUS BAR ================

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// ================ CHECK THE DEVICE ORIENTATION ================

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// ================ CHECK THE DEVICE ORIENTATION ================

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// ================ TOGGLE FULL SCREEN MODE ================

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// ================ GET THE SCREEN DIMENSIONS ================

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// ================ GET THE SCREEN DIMENSIONS ================

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// ================ GET THE PIXEL DENSITY OF THE SCREEN ================

  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// ================ GET THE HEIGHT OF THE STATUS BAR ================

  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  /// ================ GET THE HEIGHT OF THE BOTTOM NAVIGATION BAR ================

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;

    /// -- BY FLUTTER DEFAULT 56.0 --
  }

  /// ================ GET THE HEIGHT OF THE APP BAR ================

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// ================ GET THE HEIGHT OF THE KEYBOARD ================

  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// ================ CHECK IF THE KEYBOARD IS CURRENTLY VISIBLE ================

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// ================ CHECK IF THE APP IS RUNNING ON A PHYSICAL DEVICE ================

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// ================ TRIGGER DEVICE VIBRATION ================

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// ================ LOOK THE APP TO SPECIFIC ORIENTATION ================

  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// ================ CONTROL STATUS BAR VISIBILITY ================

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// ================ CONTROL STATUS BAR VISIBILITY ================

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
