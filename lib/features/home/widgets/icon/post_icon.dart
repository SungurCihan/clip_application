import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class PostIcon extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const PostIcon({Key? key, required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _iconSize = context.height * 4;

    return IconButton(
        iconSize: _iconSize,
        color: Colors.white,
        icon: icon,
        onPressed: onPressed);
  }
}
