import 'dart:ui' as ui;

import 'package:clip_application/features/home/cubit/storage_image/cubit/storage_image_cubit.dart';
import 'package:clip_application/features/home/service/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/navigation/navigation_manager.dart';
import '../../../product/widgets/card/story_cart.dart';
import '../widgets/icon/post_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StorageImageCubit(),
      child: BlocConsumer<StorageImageCubit, StorageImageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.colorScheme.background,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                _story(context),
              ],
              body: _posts(context, state),
            ),
          );
        },
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

  Container _posts(BuildContext context, StorageImageState state) {
    return Container(
        decoration: const BoxDecoration(),
        margin: EdgeInsets.only(top: context.height * 1),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView.builder(
            itemCount: state.list?.items.length ?? 0,
            itemBuilder: (context, index) {
              return FutureBuilder(
                  future: FirebaseStorageService.instance
                      .downloadUrl('images/${state.list!.items[index].name}'),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Align(
                        child: _postCart(context, snapshot.data!),
                        alignment: Alignment.topCenter,
                        heightFactor: 0.9,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return const SizedBox();
                  });
            }));
  }

  Widget _postCart(BuildContext context, String imageUrl) {
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
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
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
