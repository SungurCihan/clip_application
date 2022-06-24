import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [_searchBar(context)],
          body: _photos(context),
        ));
  }

  SliverAppBar _searchBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      //bottomOpacity: 0,
      elevation: 0,
      backgroundColor: context.colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(ApplicationConstants.radius * 3.5),
            bottomRight: Radius.circular(ApplicationConstants.radius * 3.5)),
      ),
      title: Container(
        decoration: BoxDecoration(
            color: context.colorScheme.onBackground,
            borderRadius: BorderRadius.circular(20)),
        height: context.height * 4.5,
        child: Padding(
          padding: context.paddingMediumLeft,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: context.colorScheme.background,
              suffixIcon: Icon(IconlyLight.search,
                  color: context.colorScheme.onSecondary),
              hintText: 'Ara',
            ),
          ),
        ),
      ),
    );
  }

  Container _photos(BuildContext context) {
    return Container(
      padding: context.paddingMediumTop,
      height: context.mediaQuery.size.height,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return _postCart(context.height * 60, context.width * 31, index,
                  true, context);
            } else {
              return _postCart(context.height * 60, context.width * 31, index,
                  false, context);
            }
          }),
    );
  }

  Widget _postCart(double postSize, double postWidth, int isFirst, bool isLeft,
      BuildContext context) {
    return Container(
      width: (postWidth * 100) / 31,
      margin: EdgeInsets.only(
          right: context.mediumValue, left: context.mediumValue),
      height: postSize,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    isLeft
                        ? _cart(postSize / 2 - 2, postWidth * 2 + 2, 0,
                            isFirst == 0 ? ApplicationConstants.radius * 3 : 0)
                        : Column(
                            children: [
                              _cart(
                                  postSize / 4 - 2,
                                  postWidth,
                                  isFirst == 0
                                      ? ApplicationConstants.radius * 3
                                      : 0,
                                  0),
                              _cart(postSize / 4 - 2, postWidth, 0, 0)
                            ],
                          ),
                    isLeft
                        ? Column(
                            children: [
                              _cart(
                                  postSize / 4 - 2,
                                  postWidth,
                                  isFirst == 0
                                      ? ApplicationConstants.radius * 3
                                      : 0,
                                  0),
                              _cart(postSize / 4 - 2, postWidth, 0, 0)
                            ],
                          )
                        : _cart(postSize / 2 - 2, postWidth * 2 + 2, 0,
                            isFirst == 0 ? ApplicationConstants.radius * 3 : 0),
                  ],
                ),
              ],
            ),
            _defaultLine(postSize, postWidth),
            _defaultLine(postSize, postWidth),
          ],
        ),
      ),
    );
  }

  Widget _defaultLine(double postSize, double postWidth) {
    return Row(
      children: [
        _cart(postSize / 4 - 2, postWidth, 0, 0),
        _cart(postSize / 4 - 2, postWidth, 0, 0),
        _cart(postSize / 4 - 2, postWidth, 0, 0),
      ],
    );
  }

  Widget _cart(double postSize, double postWidth, double radiusRight,
      double radiusLeft) {
    return Container(
      margin: const EdgeInsets.all(1),
      width: postWidth,
      height: postSize,
      // margin: EdgeInsets.only(right: 5, left: 5),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusLeft),
            topRight: Radius.circular(radiusRight)),
        //border: Border.all(color: Colors.black),
        color: Colors.red,
        image: DecorationImage(
            image: AssetImage(ImageConstants.instance.post), fit: BoxFit.cover),
        //borderRadius: BorderRadius.all(Radius.circular(10)),
        //border: Border.all(color: Color(0xffFF007F))
      ),
    );
  }
}
