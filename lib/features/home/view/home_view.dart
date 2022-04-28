import 'package:clip_application/core/constants/navigation/navigation_constants.dart';
import 'package:clip_application/core/init/navigation/navigation_manager.dart';
import 'package:clip_application/product/widgets/card/story_cart.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../widgets/icon/post_icon.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'package:iconly/iconly.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _story(context),
        ],
        body: _posts(context),
      ),
    );
  }

  SliverAppBar _story(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.colorScheme.background,
      actions: [
        Flexible(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 70,
              itemBuilder: (context, index) {
                return StoryCart(
                  width: context.height * 7,
                  height: context.height * 7,
                );
              }),
        ),
      ],
    );
  }

  Container _posts(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      margin: EdgeInsets.only(top: context.height * 1),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: ListView.builder(
          //scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Align(
              child: _postCart(context),
              alignment: Alignment.topCenter,
              heightFactor: 0.9,
            );
          }),
    );
  }

  Widget _postCart(BuildContext context) {
    return Container(
      height: context.height * 70,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: context.colorScheme.background, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ApplicationConstants.radius * 4),
              topRight: Radius.circular(ApplicationConstants.radius * 4)),
          image: DecorationImage(
              image: AssetImage(ImageConstants.instance.post),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _leftCorner(context),
          _bottom(context),
        ],
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Container(
      height: context.height * 7,
      margin: EdgeInsets.only(
          bottom: context.width * 18,
          right: context.width * 3,
          left: context.width * 3),
      padding: const EdgeInsets.only(left: 5, right: 5),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(45),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ApplicationConstants.radius * 4.5),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.only(
                left: context.width * 2, right: context.width * 2),
            child: _icons(context),
          ),
        ),
      ),
    );
  }

  Widget _icons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                const PostIcon(icon: Icon(IconlyLight.heart)),
                Text('7.6k', style: context.textTheme.bodyText1)
              ],
            ),
            const PostIcon(icon: Icon(IconlyLight.chat)),
            const PostIcon(icon: Icon(IconlyLight.send))
          ],
        ),
        const PostIcon(icon: Icon(IconlyLight.bookmark))
      ],
    );
  }

  Widget _leftCorner(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: context.height * 2, left: context.height * 2),
      child: InkWell(
        onTap: () {
          NavigationManager.instance
              .navigateToPage(path: NavigationCostants.profile);
        },
        child: Row(
          children: [
            Container(
              width: context.height * 4,
              height: context.height * 4,
              margin: EdgeInsets.symmetric(horizontal: context.width * 2),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.instance.story),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.all(
                    Radius.circular(ApplicationConstants.radius)),
              ),
            ),
            const Text(
              'Beauty Saloon',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
