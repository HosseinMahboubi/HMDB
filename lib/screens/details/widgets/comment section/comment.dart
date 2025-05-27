import 'package:flutter/material.dart';
import 'package:hmdb/screens/details/widgets/comment%20section/build_comment.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class HMComment extends StatelessWidget {
  const HMComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// --- Responsive dimensions ---
    final double horizontalPadding =
        MediaQuery.of(context).size.width * 0.05; // ~5% of screen width
    final double verticalPadding =
        MediaQuery.of(context).size.height * 0.01; // ~1% of screen height

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        children: [
          /// -- COMMENT STARTER => COMMENTS AND SEE ALL SECTION --
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "comments".translate(context),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: MediaQuery.of(context).size.width *
                          0.05, // ~5% of screen width
                      fontWeight: FontWeight.w500,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "see_all".translate(context),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: HMHelperFunction.isDarkMode(context)
                            ? HMColors.primary
                            : HMColors.buttonAlt,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              )
            ],
          ),

          /// -- BUILD COMMENT CARD --
          HMBuildCommentCard(),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.15), // ~15% of screen height
        ],
      ),
    );
  }
}

/*
          // Replace:
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          USE IT IN LINE 46 IF YOU DON'T WANT TO USE THE HELPER FUNCTION
   */
