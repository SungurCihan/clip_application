import 'package:flutter/material.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';

class StoryCart extends StatelessWidget {
  final String? imageUrl;
  final Color? borderColor;
  final double? width;
  final double? height;

  const StoryCart(
      {Key? key, this.imageUrl, this.borderColor, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width * 15,
      height: height ?? context.width * 15,
      margin: EdgeInsets.only(right: context.lowValue, left: context.lowValue),
      padding: context.paddingMedium,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageUrl ?? ImageConstants.instance.story),
              fit: BoxFit.contain),
          borderRadius: BorderRadius.all(
              Radius.circular(ApplicationConstants.radius * 2.7)),
          border:
              Border.all(color: borderColor ?? context.colorScheme.primary)),
    );
  }
}
