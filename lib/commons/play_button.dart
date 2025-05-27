import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';

class HMPlayButton extends StatelessWidget {
  const HMPlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: HMColors.primary.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.play_arrow,
          color: Colors.black,
          size: 32,
        ),
      ),
    );
  }
}
