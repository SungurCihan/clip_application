import 'package:clip_application/core/init/theme/light/text_scheme.dart';
import 'package:clip_application/product/widgets/button/grey_button.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../widgets/button/account_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: ListView(
        children: [_topSide(context), _midSide(context), _bottomSide(context)],
      ),
    );
  }

  Widget _bottomSide(BuildContext context) {
    return Padding(
      padding: context.paddingHighTop,
      child: Column(
        children: const [
          AccountButton(
            icon: Icon(IconlyLight.message),
            text: 'E-mail',
          ),
          AccountButton(
            icon: Icon(IconlyLight.calling),
            text: 'Telefon Numarası',
          ),
          AccountButton(
            icon: Icon(IconlyLight.wallet),
            text: 'Cüzdan',
          ),
          AccountButton(
            icon: Icon(IconlyLight.unlock),
            text: 'Şifre',
          ),
          AccountButton(
            icon: Icon(IconlyLight.info_square),
            text: 'Yardım',
          ),
          AccountButton(
            icon: Icon(IconlyLight.logout),
            text: 'Çıkış',
          ),
        ],
      ),
    );
  }

  Widget _midSide(BuildContext context) {
    return Padding(
      padding: context.paddingNormalTop,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GreyButton(
            text: 'Profili Düzenle',
            textStyle: TextThemeLight.instance.blueSmallFont,
            icon: Icon(
              IconlyLight.edit,
              color: context.colorScheme.surface,
            ),
          ),
          GreyButton(
            text: 'Kaydedilenler',
            textStyle: TextThemeLight.instance.blueSmallFont,
            icon: Icon(
              IconlyLight.edit,
              color: context.colorScheme.surface,
            ),
          )
        ],
      ),
    );
  }

  Container _mediumBar(BuildContext context, String text, Icon icon) {
    return Container(
      height: context.height * 4,
      width: context.width * 45,
      decoration: BoxDecoration(
          color: context.colorScheme.onBackground,
          borderRadius:
              BorderRadius.all(Radius.circular(ApplicationConstants.radius))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: context.colorScheme.surface,
            ),
          ),
          SizedBox(
            width: context.lowValue,
          ),
          icon
        ],
      ),
    );
  }

  Row _topSide(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: context.height * 3, right: context.height * 5),
          child: Column(
            children: [
              Text(
                '100',
                style: TextStyle(fontSize: ApplicationConstants.fontSizeMedium),
              ),
              Text(
                'comment',
                style: TextStyle(
                    color: context.colorScheme.secondary, fontSize: 18),
              )
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: context.height * 9,
              height: context.height * 9,
              //margin: EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.instance.post),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(
                      Radius.circular(ApplicationConstants.radius * 1.5)),
                  border: Border.all(color: Colors.black)),
            ),
            Container(
                margin: context.paddingMediumTop,
                child: const Text('Burak Yıldırım'))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: context.height * 3, left: context.height * 5),
          child: Column(
            children: [
              Text(
                '700',
                style: TextStyle(fontSize: ApplicationConstants.fontSizeMedium),
              ),
              Text(
                'following',
                style: TextStyle(
                    color: context.colorScheme.secondary, fontSize: 18),
              )
            ],
          ),
        ),
      ],
    );
  }
}
