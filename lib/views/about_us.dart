import 'package:timer/constants/pages.dart';
import 'package:timer/constants/enums/image_variation.dart';
import 'package:timer/extensions/build_context.dart';
import 'package:timer/constants/enums/icons.dart';
import 'package:timer/constants/enums/spacing.dart';
import 'package:timer/constants/enums/text_variations.dart';
import 'package:timer/theme.dart';
import 'package:timer/widgets/app_image.dart';
import 'package:timer/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:timer/widgets/typo.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AboutUsConstants.arrowColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          context.translations.aboutUsTitle,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: CustomTheme.color(CustomColors.main_yellow),
      ),
      body: AppGeneralBackground(
        key: AboutUsConstants.backgroundKey,
        child: Margin.symmetric(
          horizontal: Spacing.tiny,
          vertical: Spacing.small,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacerWidget.verticalSmall(),
                SizedBox(
                  height: AboutUsConstants.logoHeight,
                  width: double.infinity,
                  child: AppImage(
                    image: ImageVariation.logo,
                    quality: ImageQuality.high,
                  ),
                ),
                SpacerWidget.verticalSmall(),
                Container(
                    height: AboutUsConstants.separatorHeight,
                    width: double.infinity,
                    color: CustomTheme.color(CustomColors.main_yellow)),
                SpacerWidget.verticalSmall(),
                ...context.translations.aboutUsDescription
                    .split('\n')
                    .map((e) => Margin(
                          bottom: Spacing.small,
                          child: Typo(
                            e,
                            variation: TextVariation.bodyLarge,
                          ),
                        )),
                ...context.translations.aboutUsCompany
                    .split('\n')
                    .map((e) => Margin(
                          bottom: Spacing.tiny,
                          child: Typo(
                            e,
                            variation: TextVariation.bodySmall,
                          ),
                        )),
                SpacerWidget.verticalSmall(),
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () =>
                      launchUrl(Uri.parse(AboutUsConstants.facebookUrl)),
                  icon: SvgPicture.asset(
                    IconVariation.facebook.path,
                    color: Colors.white,
                  ),
                ),
                SpacerWidget.verticalTiny(),
                Container(
                    height: AboutUsConstants.separatorHeight,
                    width: double.infinity,
                    color: CustomTheme.color(CustomColors.main_yellow)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
