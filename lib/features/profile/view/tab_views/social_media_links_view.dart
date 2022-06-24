import '../../../../core/extensions/context_extension.dart';
import '../../../home/widgets/button/account_button.dart';
import 'package:flutter/material.dart';

import '../../../../product/widgets/card/horizontal_divider.dart';

class SocialMediaLinksView extends StatelessWidget {
  const SocialMediaLinksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Padding(
        padding: context.paddingMediumTop,
        child: Center(
          child: Padding(
            padding: context.paddingNormalHorizontal,
            child: ListView(
              children: [
                const HorizontalDivider(),
                SizedBox(
                  height: context.height * 2,
                ),
                const AccountButton(
                  icon: Icon(Icons.tiktok),
                  text: 'TikTok',
                  suffixIcon: Icon(Icons.link),
                ),
                const AccountButton(
                  icon: Icon(Icons.facebook),
                  text: 'Facebook',
                  suffixIcon: Icon(Icons.link),
                ),
                const AccountButton(
                  icon: Icon(Icons.youtube_searched_for),
                  text: 'Youtube',
                  suffixIcon: Icon(Icons.link),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
