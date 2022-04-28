import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app/application_constants.dart';

class MapButton extends StatelessWidget {
  final String? text;

  const MapButton({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          height: context.height * 4.5,
          width: context.width * 45,
          decoration: BoxDecoration(
              color: context.colorScheme.onBackground,
              borderRadius: BorderRadius.all(
                  Radius.circular(ApplicationConstants.radius))),
          child: Center(
            child: Text(
              text ?? '',
              style: TextStyle(color: context.colorScheme.surface),
            ),
          ),
        ));
  }
}
