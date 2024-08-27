import 'package:timer/constants/terms.dart';
import 'package:timer/extensions/build_context.dart';
import 'package:timer/models/spacing.dart';
import 'package:timer/models/term.dart';
import 'package:timer/models/text_variations.dart';
import 'package:timer/theme.dart';
import 'package:flutter/material.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:timer/widgets/typo.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Typo(
          context.translations.termsTitle,
          variation: TextVariation.headlineSmall,
          color: Colors.black,
        ),
        backgroundColor: CustomTheme.color(CustomColors.main_yellow),
      ),
      body: Margin.symmetric(
        horizontal: Spacing.tiny,
        vertical: Spacing.small,
        child: Container(
          color: Colors.grey[900],
          child: ListView(
            children: TermsConstants.content
                .map((e) => _TermItemWidget(
                      item: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _TermItemWidget extends StatelessWidget {
  _TermItemWidget({Key? key, required this.item}) : super(key: key);

  final Term item;
  @override
  Widget build(BuildContext context) {
    return Margin(
      top: Spacing.tiny,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.title != null)
            Typo(
              item.title!,
              variation: TextVariation.headlineSmall,
            ),
          if (item.description != null) SpacerWidget.verticalTiny(),
          if (item.description != null)
            Typo(
              item.description!,
            )
        ],
      ),
    );
  }
}
