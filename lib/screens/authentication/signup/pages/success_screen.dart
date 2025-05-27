import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/constants/spacing_styles.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.titleKey,
    required this.subTitleKey,
    required this.onPressed,
  });

  final String image, titleKey, subTitleKey;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive dimensions ---
    final double spacing =
        MediaQuery.of(context).size.height * 0.02; // ~2% of screen height
    final double imageWidth =
        MediaQuery.of(context).size.width * 0.6; // ~60% of screen width

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HMSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              SizedBox(height: spacing * 2),

              /// -- SVG IMAGE --
              Center(
                child: SvgPicture.asset(
                  image,
                  width: imageWidth,
                ),
              ),
              SizedBox(height: spacing),

              /// -- TITLE and SUBTITLE --
              Text(
                titleKey.translate(context),
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: spacing),
              Text(
                subTitleKey.translate(context),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: spacing),

              /// - BUTTONS --
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        dark ? HMColors.primary : HMColors.buttonSecondary,
                    foregroundColor: dark ? HMColors.black : HMColors.white,
                    elevation: 0,
                    side: BorderSide(
                      color: dark ? HMColors.darkerGrey : Colors.transparent,
                      width: 0,
                    ),
                  ),
                  child: Text('continue'.translate(context)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
