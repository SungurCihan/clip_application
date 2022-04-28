import 'package:flutter/material.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';

class Logo extends StatelessWidget {
  final double? width;
  final double? height;

  const Logo({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? context.width * 45,
        height: height ?? context.height * 20,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            ImageConstants.instance.logo,
          ),
        )));
  }
}
