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

    return Padding(
      padding: const EdgeInsets.all(HMSizes.defaultSpace),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? HMColors.darkContainer : HMColors.lightContainer,
          borderRadius: BorderRadius.circular(20),
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
              size: 22,
            ),
            suffixIcon: Obx(() {
              if (searchController.searchQuery.isNotEmpty) {
                return IconButton(
                  icon: Icon(
                    Iconsax.close_circle,
                    color: isDark ? HMColors.textSecondary : HMColors.grey,
                    size: 22,
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
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
