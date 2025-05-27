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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          /// -- COMMENT STARTER => COMMENTS AND SEE ALL SECTION --
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "comments".translate(context),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 20,
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

          SizedBox(height: HMHelperFunction.screenHeight() * 0.15),
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
