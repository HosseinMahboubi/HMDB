import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/data/movies.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsController extends GetxController {
  /// --- For easy controller access throughout the app ---
  static DetailsController get instance => Get.find();

  /// -- DATA PROPERTIES --
  final MovieModel movie;

  /// -- CONSTRUCTOR => INITIALIZE THE CONTROLLER --
  DetailsController({required this.movie});

  /// -- CREATE TAG WIDGETS FOR THE MOVIE GENRES --
  List<Widget> buildMovieTags(BuildContext context) {
    List<String> tags = [];

    /// --- First check if the movie has its own tags ---
    if (movie.movieTags != null && movie.movieTags!.isNotEmpty) {
      if (movie.movieTags!.first is Map) {
        tags = movie.movieTags!
            .map((tag) =>
                tag is Map ? tag['name']?.toString() ?? '' : tag.toString())
            .toList();
      } else {
        tags = movie.movieTags!.map((tag) => tag.toString()).toList();
      }
    } else {
      /// --- Default tags if the movie doesn't have any ---
      tags = ['Drama', 'Action'];
    }

    /// -- TAG COLOR --
    Color getTagColor(String tag) {
      return HMColors.primary;
    }

    /// -- CREATE A WIDGET FOR EACH TAG --
    return tags.map((tag) {
      String translatedTag = tag.toLowerCase().translate(context);
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: getTagColor(tag),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          translatedTag,
          style: const TextStyle(
            color: HMColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }).toList();
  }

  /// -- METHODS --

  /// --- Opens the movie trailer in external app or browser ---
  Future<void> launchTrailer(BuildContext context) async {
    final trailerUrl = movie.movieTrailerURL;

    if (trailerUrl == null || trailerUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No trailer available for this movie')),
      );
      return;
    }

    try {
      String urlToLaunch = trailerUrl;
      if (trailerUrl.contains('youtube.com/watch')) {
        final Uri uri = Uri.parse(trailerUrl);
        final videoId = uri.queryParameters['v'];
        if (videoId != null) {
          urlToLaunch = 'https://youtu.be/$videoId';
        }
      }

      final Uri url = Uri.parse(urlToLaunch);

      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );

      if (!launched) {
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode.platformDefault,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open trailer: $urlToLaunch')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error launching trailer: $e')),
      );
    }
  }

  /// --- Opens the movie watch link in external app or browser ---
  Future<void> watchMovie(BuildContext context) async {
    final watchUrl = movie.movieWatchURL;

    if (watchUrl == null || watchUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'no_watch_link_available_for_this_movie'.translate(context),
          ),
        ),
      );
      return;
    }

    try {
      final Uri url = Uri.parse(watchUrl);
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );

      if (!launched) {
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode.platformDefault,
          );
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not open watch link: $watchUrl')),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening watch link: $e')),
        );
      }
    }
  }
}
