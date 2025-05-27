import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';

Widget HMBuildCommentCard() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20),
    height: 160,
    child: ListView.builder(
      /// -- COUNT THE NUMBER OF COMMENTS --
      itemCount: popularImages[0].comments!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HMHelperFunction.isDarkMode(context)
                ? HMColors.searchBar
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: HMColors.primary.withOpacity(0.1),
              width: 1,
            ),
          ),
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            /// -- ALIGN VERTICALLY LEFT --
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// -- SHOWS THE USER'S AVATAR --
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              forYouImage[0]
                                  .comments![index]["imageUrl"]
                                  .toString(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: HMSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        /// -- SHOWS THE USER'S NAME AND DATA OF THE COMMENT --
                        children: [
                          Text(
                            forYouImage[0]
                                .comments![index]['name']
                                .toString()
                                .translate(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            forYouImage[0].comments![index]['date'],
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// -- SHOWS THE RATING AND STAR ICON --
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        forYouImage[0].comments![index]['rating'],
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Iconsax.star1,
                        color: Colors.amber,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),

              /// -- SHOWS THE USER'S COMMENT TEXT --
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  forYouImage[0]
                      .comments![index]['comment']
                      .toString()
                      .translate(context),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
