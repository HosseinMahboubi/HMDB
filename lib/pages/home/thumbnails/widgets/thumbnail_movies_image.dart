import 'package:flutter/material.dart';

class HMThumbnailMovieImage extends StatelessWidget {
  const HMThumbnailMovieImage({
    super.key,
    required this.imageAsset,
  });

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAsset,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
