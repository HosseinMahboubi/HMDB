import 'package:flutter/material.dart';

class HMNavigationPagesMoviePoster extends StatelessWidget {
  const HMNavigationPagesMoviePoster({
    super.key,
    required this.image,
  });

  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
