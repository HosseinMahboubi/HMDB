// import 'package:flutter/material.dart';
// import 'package:hmdb/utils/constants/colors.dart';
//
// class HMCloseButton extends StatelessWidget {
//   const HMCloseButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     /// --- Responsive dimensions ---
//     final double topPosition =
//         MediaQuery.of(context).size.height * 0.05; // ~5% of screen height
//     final double rightPosition =
//         MediaQuery.of(context).size.width * 0.04; // ~4% of screen width
//     final double iconSize =
//         MediaQuery.of(context).size.width * 0.07; // ~7% of screen width
//     final double padding =
//         MediaQuery.of(context).size.width * 0.02; // ~2% of screen width
//
//     return Positioned(
//       top: topPosition,
//       right: rightPosition,
//       child: Material(
//         color: Colors.transparent,
//         shape: const CircleBorder(),
//         elevation: 4,
//         child: InkWell(
//           customBorder: const CircleBorder(),
//           onTap: () => Navigator.of(context).pop(),
//           child: Container(
//             padding: EdgeInsets.all(padding),
//             decoration: BoxDecoration(
//               color: HMColors.primary.withOpacity(0.9),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.close,
//               color: Colors.white,
//               size: iconSize,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
