import 'package:flutter/material.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';

class Map extends StatelessWidget {
  final Widget? bottom;

  const Map({Key? key, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: context.height * 40,
          width: context.width * 90,
          padding: context.paddingMedium,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.instance.map),
                  fit: BoxFit.cover)),
        ),
        bottom ?? const SizedBox()
      ],
    );
  }
}
