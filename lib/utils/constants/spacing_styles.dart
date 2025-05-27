import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';

class HMSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: HMSizes.appBarHeight,
    left: HMSizes.defaultSpace,
    bottom: HMSizes.defaultSpace,
    right: HMSizes.defaultSpace,
  );

  /// ================ COMMON HORIZONTAL PADDING ================
  static const EdgeInsetsGeometry horizontalPadding = EdgeInsets.symmetric(
    horizontal: 30.0,
  );

  /// ================ COMMON CONTENT PADDING ================
  static const EdgeInsetsGeometry contentPadding = EdgeInsets.all(
    HMSizes.defaultSpace,
  );

  /// ================ CARD PADDING ================
  static const EdgeInsetsGeometry cardPadding = EdgeInsets.all(
    HMSizes.md,
  );

  /// ================ SECTION PADDING ================
  static const EdgeInsetsGeometry sectionPadding = EdgeInsets.symmetric(
    horizontal: 30.0,
    vertical: 20.0,
  );
}
