import 'package:flutter/material.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:iconsax/iconsax.dart';

class HMBuildCommentCard extends StatelessWidget {
  const HMBuildCommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height *
              0.02), // ~2% of screen height
      height: MediaQuery.of(context).size.height * 0.2, // ~20% of screen height
      child: ListView.builder(
        itemCount: popularImages[0].comments!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width:
                MediaQuery.of(context).size.width * 0.8, // ~80% of screen width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width *
                      0.05), // ~5% of screen width
              color: HMHelperFunction.isDarkMode(context)
                  ? HMColors.searchBar
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: MediaQuery.of(context).size.width *
                      0.03, // ~3% of screen width
                  offset: Offset(
                      0,
                      MediaQuery.of(context).size.height *
                          0.005), // ~0.5% of screen height
                ),
              ],
              border: Border.all(
                color: HMColors.primary.withOpacity(0.1),
                width: 1,
              ),
            ),
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width *
                    0.04), // ~4% of screen width
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height *
                  0.015, // ~1.5% of screen height
              horizontal: MediaQuery.of(context).size.width *
                  0.05, // ~5% of screen width
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width *
                              0.12, // ~12% of screen width
                          width: MediaQuery.of(context).size.width *
                              0.12, // ~12% of screen width
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.04), // ~4% of screen width
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              forYouImage[0]
                                  .comments![index]['name']
                                  .toString()
                                  .translate(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.005), // ~0.5% of screen height
                            Text(
                              forYouImage[0].comments![index]['date'],
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          forYouImage[0].comments![index]['rating'],
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.01), // ~1% of screen width
                        Icon(
                          Iconsax.star1,
                          color: Colors.amber,
                          size: MediaQuery.of(context).size.width *
                              0.03, // ~3% of screen width
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height *
                          0.01), // ~1% of screen height
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
}
