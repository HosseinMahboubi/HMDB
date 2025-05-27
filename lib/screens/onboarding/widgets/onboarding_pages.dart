import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.titleKey,
    required this.subTitleKey,
  });

  final String image, titleKey, subTitleKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(HMSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: HMSizes.spaceBtwItems),
          SvgPicture.asset(
            image,
            width: HMHelperFunction.screenWidth() * 0.8,
            height: HMHelperFunction.screenHeight() * 0.6,
          ),
          Text(
            titleKey.translate(context),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: HMSizes.spaceBtwItems),
          Text(
            subTitleKey.translate(context),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
