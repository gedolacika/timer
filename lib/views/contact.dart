import 'package:timer/constants/pages.dart';
import 'package:timer/extensions/build_context.dart';
import 'package:timer/constants/enums/icons.dart';
import 'package:timer/constants/enums/spacing.dart';
import 'package:timer/constants/enums/text_variations.dart';
import 'package:timer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:timer/widgets/typo.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ContactConstants.arrowColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Typo(
          context.translations.contactTitle,
          color: ContactConstants.titleColor,
        ),
        backgroundColor: CustomTheme.color(CustomColors.main_yellow),
      ),
      body: Margin.symmetric(
        horizontal: Spacing.small,
        vertical: Spacing.medium,
        child: Container(
          color: CustomTheme.color(CustomColors.main_purple),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Typo(
                  context.translations.contactCompanyName,
                  variation: TextVariation.headlineMedium,
                ),
                SpacerWidget.verticalSmall(),
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: ContactConstants.iconColor,
                        size: ContactConstants.iconHeight,
                      ),
                      SpacerWidget.horizontalSmall(),
                      Typo(
                        context.translations.contactEmailAddress,
                        variation: TextVariation.bodyLarge,
                      )
                    ],
                  ),
                  onTap: () => launchUrl(Uri.dataFromString(
                      'mailto:${context.translations.contactCompanyName}')),
                ),
                SpacerWidget.verticalSmall(),
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.public,
                        color: ContactConstants.iconColor,
                        size: ContactConstants.iconHeight,
                      ),
                      SpacerWidget.horizontalSmall(),
                      Typo(
                        context.translations.contactWebpage,
                        variation: TextVariation.bodyLarge,
                      )
                    ],
                  ),
                  onTap: () => launchUrl(
                      Uri.dataFromString(context.translations.contactWebpage)),
                ),
                SpacerWidget.verticalLarge(),
                Row(
                  children: [
                    SvgPicture.asset(
                      IconVariation.location.path,
                      color: ContactConstants.iconColor,
                    ),
                    SpacerWidget.horizontalSmall(),
                    Typo(
                      context.translations.contactCompanyLocation,
                      variation: TextVariation.bodyLarge,
                    )
                  ],
                ),
                SpacerWidget.verticalSmall(),
                _ContactSeparator(),
                SpacerWidget.verticalSmall(),
                GestureDetector(
                  onTap: () => launchUrl(Uri.dataFromString(
                      'tel:${context.translations.contactPhoneNumber}')),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconVariation.phoneCall.path,
                        color: ContactConstants.iconColor,
                      ),
                      SpacerWidget.horizontalSmall(),
                      Typo(
                        context.translations.contactPhoneNumber,
                        variation: TextVariation.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SpacerWidget.verticalSmall(),
                _ContactSeparator(),
                SpacerWidget.verticalSmall(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactSeparator extends StatelessWidget {
  const _ContactSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 2, width: double.infinity, color: Colors.yellow);
  }
}