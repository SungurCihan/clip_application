import 'package:flutter/material.dart';

import '../../../../core/constants/app/application_constants.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../product/widgets/ui/shadow_constant.dart';

class AuthCard extends StatelessWidget {
  final ImageProvider? image;

  const AuthCard({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 15,
      height: context.width * 15,
      decoration: BoxDecoration(
          boxShadow: [ShadowConstant.boxShadow],
          borderRadius: BorderRadius.circular(ApplicationConstants.radius),
          border: Border.all(color: context.colorScheme.onSurface),
          image: DecorationImage(
              image: image ?? AssetImage(ImageConstants.instance.logo),
              fit: BoxFit.contain)),
    );
  }
}
