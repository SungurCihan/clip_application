import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_manager.dart';
import '../widgets/card/profile_star_bar.dart';
import '../../../product/widgets/card/top_profile.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/theme/light/color_scheme.dart';
import 'tab_views/post_view.dart';
import 'tab_views/saloon_photos_view.dart';
import 'tab_views/social_media_links_view.dart';
import 'tab_views/videos_view.dart';
import '../../../product/widgets/button/grey_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../product/widgets/card/logo.dart';
import '../../../product/widgets/card/story_cart.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.colorScheme.onPrimary,
      body: Column(
        children: [_topSide(context), _bottomSide(context)],
      ),
    );
  }

  Container _bottomSide(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: context.height * 2),
        height: context.height * 44,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.all(
                Radius.circular(ApplicationConstants.radius * 2))),
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: context.colorScheme.background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(ApplicationConstants.radius * 2),
                        topRight:
                            Radius.circular(ApplicationConstants.radius * 2))),
                actions: [
                  Expanded(
                    child: TabBar(
                        indicatorColor: context.colorScheme.secondary,
                        tabs: [
                          Tab(
                              icon: Icon(IconlyLight.category,
                                  color: context.colorScheme.onSecondary)),
                          Tab(
                            icon: Icon(IconlyLight.video,
                                color: context.colorScheme.onSecondary),
                          ),
                          Tab(
                            icon: Icon(IconlyLight.image,
                                color: context.colorScheme.onSecondary),
                          ),
                          Tab(
                            icon: Icon(IconlyLight.chart,
                                color: context.colorScheme.onSecondary),
                          ),
                        ]),
                  ),
                ],
              ),
              body: const TabBarView(children: [
                PostsView(),
                VideosView(),
                SaloonPhotosView(),
                SocialMediaLinksView()
              ]),
            )));
  }

  Container _topSide(BuildContext context) {
    return Container(
      height: context.height * 44,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(ApplicationConstants.radius * 2),
            bottomRight: Radius.circular(ApplicationConstants.radius * 2)),
      ),
      child: Column(
        children: [
          const Expanded(flex: 3, child: TopProfile()),
          const Expanded(flex: 2, child: ProfileStarBar()),
          Expanded(flex: 3, child: _buttons(context)),
          Expanded(flex: 2, child: _stories(context)),
          const Expanded(flex: 1, child: SizedBox())
        ],
      ),
    );
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

  Widget _stories(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          left: context.width * 5,
        ),
        //height: context.height * 8,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return StoryCart(
                width: context.width * 15,
                height: context.height * 15,
              );
            }));
  }

  Widget _buttons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: GreyButton(
                      text: 'Detaylar',
                      onTap: () {
                        NavigationManager.instance.navigateToPage(
                            path: NavigationCostants.profileDetail);
                      })),
              SizedBox(
                width: context.width * 2,
              ),
              const Expanded(
                  flex: 4,
                  child: GreyButton(
                    text: 'Yorumlar',
                  )),
            ],
          ),
          SizedBox(
            height: context.height,
          ),
          GreyButton(
            text: 'Randevu al',
            width: context.width * 84,
            backgroundColor: ColorSchemeLight.instance.battleToad,
            textStyle: TextStyle(color: context.colorScheme.background),
          )
        ],
      ),
    );
  }

  Widget _starPart(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 8),
      child: SizedBox(
        height: context.height * 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
                flex: 8,
                child: Text(
                  'The Barber',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )),
            const Expanded(flex: 1, child: SizedBox()),
            VerticalDivider(
              color: context.colorScheme.secondary,
              indent: context.height * 3.5,
              endIndent: context.height * 3.5,
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 8,
              child: Center(
                child: SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: 2.49,
                  color: context.colorScheme.tertiary,
                  borderColor: context.colorScheme.onTertiary,
                  size: context.height * 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topProfile(BuildContext context) {
    return Padding(
      padding: context.paddingMediumTop,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: context.paddingMediumTop * 3,
                child: const Center(
                    child: Text(
                  '50,8K',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
              ),
              Text(
                'Followers',
                style: TextStyle(
                    fontSize: 18, color: context.colorScheme.secondary),
              ),
            ],
          ),
          Container(
            width: context.height * 10,
            height: context.height * 10,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImageConstants.instance.story,
                    ),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.all(
                    Radius.circular(ApplicationConstants.radius)),
                border: Border.all(
                  color: context.colorScheme.primary,
                  style: BorderStyle.solid,
                )),
          ),
          Column(
            children: [
              Padding(
                padding: context.paddingMediumTop * 3,
                child: const Center(
                    child: Text(
                  '700',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
              ),
              Text(
                'Comment',
                style: TextStyle(
                    fontSize: 18, color: context.colorScheme.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
