import '../../../core/extensions/context_extension.dart';
import '../widgets/card/price_list_item.dart';
import '../widgets/card/profile_star_bar.dart';
import '../../../product/widgets/card/horizontal_divider.dart';
import '../../../product/widgets/card/map.dart';
import '../../../product/widgets/card/top_profile.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/init/theme/light/text_scheme.dart';
import '../../../product/widgets/button/grey_button.dart';
import '../../../product/widgets/card/logo.dart';
import '../../../product/widgets/ui/shadow_constant.dart';

class ProfileDetailView extends StatelessWidget {
  const ProfileDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.colorScheme.onPrimary,
      body: ListView(
        children: [
          _topProfile(context),
          SizedBox(
            height: context.height * 1,
          ),
          _map(context),
          SizedBox(
            height: context.height * 1,
          ),
          _priceLists(context)
        ],
      ),
    );
  }

  Widget _priceLists(BuildContext context) {
    return Container(
        //height: context.height * 20,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [ShadowConstant.weakBoxShadow],
          color: context.colorScheme.background,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(ApplicationConstants.radius * 3),
              topLeft: Radius.circular(ApplicationConstants.radius * 3)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: context.height,
                  left: context.width * 7,
                  bottom: context.height / 2),
              child: const Align(
                  alignment: Alignment.topLeft, child: Text('Fiyat Listesi')),
            ),
            const HorizontalDivider(),
            SizedBox(
              height: context.height,
            ),
            Padding(
                padding: context.paddingNormalHorizontal,
                child: Column(
                  children: const [
                    PriceListItem(serviceName: 'Saç Kesimi', price: '20.44 TL'),
                    PriceListItem(
                        serviceName: 'Sakal Kesimi', price: '14.99 TL'),
                    PriceListItem(serviceName: 'Saç Boyama', price: '39.99 TL'),
                    PriceListItem(serviceName: 'Ağda', price: '9.99 TL'),
                    PriceListItem(serviceName: 'Fön', price: '4.99 TL'),
                    PriceListItem(serviceName: 'Manikür', price: '20.99 TL'),
                    PriceListItem(
                        serviceName: 'Kreatin Bakımı', price: '24.99 TL'),
                    PriceListItem(serviceName: 'Pedikür', price: '14.99 TL'),
                  ],
                ))
          ],
        ));
  }

  Widget _map(BuildContext context) {
    return Container(
      height: context.height * 50,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [ShadowConstant.weakBoxShadow],
          color: context.colorScheme.background,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(ApplicationConstants.radius * 3),
            bottomRight: Radius.circular(ApplicationConstants.radius * 3),
            topLeft: Radius.circular(ApplicationConstants.radius * 3),
            topRight: Radius.circular(ApplicationConstants.radius * 3),
          )),
      child: Map(
        bottom: GreyButton(
          text: 'Yol Tarifi Al',
          width: context.width * 90,
          textStyle: TextThemeLight.instance.blueSmallFont,
        ),
      ),
    );
  }

  Widget _topProfile(BuildContext context) {
    return Container(
        height: context.height * 20,
        decoration: BoxDecoration(
          boxShadow: [ShadowConstant.weakBoxShadow],
          color: context.colorScheme.background,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ApplicationConstants.radius * 2),
              bottomRight: Radius.circular(ApplicationConstants.radius * 2)),
        ),
        child: Column(
          children: const [
            Expanded(flex: 2, child: TopProfile()),
            Expanded(flex: 1, child: ProfileStarBar()),
          ],
        ));
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: context.colorScheme.background,
        title: Center(
            child: SizedBox(height: context.height * 7, child: const Logo())));
  }
}
