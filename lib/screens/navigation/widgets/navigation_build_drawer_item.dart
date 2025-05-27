import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/utils/constants/colors.dart';

class HMNavigationBuildDrawerItem extends StatelessWidget {
  const HMNavigationBuildDrawerItem({
    super.key,
    required this.context,
    required this.icon,
    required this.label,
    required this.index,
    required this.controller,
    required this.dark,
  });

  /// ======= Variables =========

  final BuildContext context; // -- CURRENT BUILD CONTEXT --
  final IconData icon;
  final String label;
  final int index; // -- POSITION IN THE MENU --
  final NavigationController controller; // -- MANAGE CURRENTLY SELECTED MENU --
  final bool dark;

  /// --- Main function that draws the widget on the screen ---
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        /// --- Check if the current menu is selected ---
        final bool isSelected = controller.selectedIndex.value == index;
        return ListTile(
          leading: Icon(
            icon,
            color: isSelected
                ? (dark ? HMColors.primary : HMColors.primary)
                : (dark ? HMColors.lightGrey : HMColors.grey),
          ),
          title: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? (dark ? HMColors.primary : HMColors.primary)
                  : (dark ? HMColors.lightGrey : HMColors.grey),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: isSelected,
          selectedTileColor: dark ? HMColors.darkerGrey : HMColors.lightGrey,
          onTap: () {
            controller.changeIndex(index);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
