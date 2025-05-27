import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/pages/search/controller/search_controller.dart';
import 'package:hmdb/pages/search/search_results_page.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/device/device_utility.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';

class HMSearchBar extends StatelessWidget {
  const HMSearchBar({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final bool isDark = HMHelperFunction.isDarkMode(context);

    /// -- INITIALIZE THE SEARCH CONTROLLER --
    final searchController = Get.put(MovieSearchController());

    /// -- CREATE A TEXT EDITING TO MANAGE THE TEXT FIELD --
    final textController =
        TextEditingController(text: searchController.searchQuery.value);

    /// --- Responsive dimensions ---
    final double borderRadius =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double iconSize =
        MediaQuery.of(context).size.width * 0.055; // ~5.5% of screen width
    final double horizontalPadding =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double verticalPadding =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height

    return Padding(
      padding: EdgeInsets.all(horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? HMColors.darkContainer : HMColors.lightContainer,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: TextField(
          controller: textController,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }

            /// -- UPDATE SEARCH RESULT --
            searchController.search(value);
          },
          onSubmitted: (value) {
            /// -- HIDE KEYBOARD WHEN SEARCH IS SUBMITTED --
            HMDeviceUtils.hideKeyboard(context);

            if (value.isNotEmpty) {
              Get.to(() => const SearchResultsPage());
            }
          },
          decoration: InputDecoration(
            hintText: "search".translate(context),
            hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: isDark ? HMColors.textSecondary : HMColors.grey,
                ),
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: isDark ? HMColors.textSecondary : HMColors.grey,
              size: iconSize,
            ),
            suffixIcon: Obx(() {
              if (searchController.searchQuery.isNotEmpty) {
                return IconButton(
                  icon: Icon(
                    Iconsax.close_circle,
                    color: isDark ? HMColors.textSecondary : HMColors.grey,
                    size: iconSize,
                  ),
                  onPressed: () {
                    /// -- CLEAR THE SEARCH CONTROLLER --
                    searchController.clearSearch();

                    /// -- CLEAR THE TEXT FIELD --
                    textController.clear();

                    /// -- UN-FOCUS THE TEXT FIELD --
                    FocusScope.of(context).unfocus();
                  },
                );
              }
              return const SizedBox.shrink();
            }),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
          ),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDark ? HMColors.white : HMColors.black,
              ),
          cursorColor: isDark ? HMColors.primary : HMColors.buttonSecondary,
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}
