import '../../../product/widgets/card/map.dart';

import '../../../core/init/theme/light/text_scheme.dart';
import '../../../product/widgets/button/grey_button.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _greyButtonsTextStyle = TextStyle(
        fontSize: ApplicationConstants.fontSizeLow,
        color: context.colorScheme.surface);

    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [_map(context), _calender(context), _favourites(context)],
        ),
      ),
    );
  }

  Container _favourites(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ApplicationConstants.radius * 3),
          topRight: Radius.circular(ApplicationConstants.radius * 3),
        ),
      ),
      child: Padding(
        padding: context.paddingHighHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: context.mediumValue, top: context.normalValue),
              child: const Text(
                'Favoriler',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: context.colorScheme.onSurface)),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: context.paddingNormalTop,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ApplicationConstants.radius * 2)),
                      color: context.colorScheme.onBackground),
                  width: context.width * 90,
                  height: context.height * 6,
                  child: Padding(
                      padding: context.paddingNormalLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: context.width * 8,
                                height: context.width * 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ApplicationConstants.radius),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            ImageConstants.instance.story),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                width: context.height,
                              ),
                              const Text(
                                'Beauty Salon',
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: context.paddingMediumRight,
                                child: const Icon(IconlyLight.heart),
                              ),
                              Padding(
                                padding: context.paddingMediumRight,
                                child: const Icon(IconlyLight.calendar),
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _calender(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.lowValue, bottom: context.lowValue),
      width: context.width * 98,
      height: context.height * 15,
      decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.all(
              Radius.circular(ApplicationConstants.radius * 2))),
    );
  }

  Widget _map(
    BuildContext context,
  ) {
    return Container(
        height: context.height * 50,
        decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(ApplicationConstants.radius * 3),
                bottomRight: Radius.circular(ApplicationConstants.radius * 3))),
        child: Map(
          bottom: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GreyButton(
                  text: 'Kuaförleri Listele',
                  width: context.width * 40,
                  textStyle: TextThemeLight.instance.blueSmallFont,
                ),
                GreyButton(
                  text: 'Yol Tarifi Al',
                  width: context.width * 40,
                  textStyle: TextThemeLight.instance.blueSmallFont,
                )
              ],
            ),
          ),
        ));
  }
}
