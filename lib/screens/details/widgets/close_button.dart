import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';

class HMCloseButton extends StatelessWidget {
  const HMCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 15,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        elevation: 4,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: HMColors.primary.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
