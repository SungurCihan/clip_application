import 'package:flutter/material.dart';

import '../../../../core/constants/image/image_constants.dart';
import '../form/google_auth_card.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AuthCard(
          image: AssetImage(ImageConstants.instance.google),
        ),
        AuthCard(
          image: AssetImage(ImageConstants.instance.apple),
        ),
      ],
    );
  }
}
