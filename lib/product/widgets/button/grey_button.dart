import '../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app/application_constants.dart';

class GreyButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final Icon? icon;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const GreyButton(
      {Key? key,
      this.width,
      this.height,
      this.text,
      this.icon,
      this.textStyle,
      this.onTap,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? context.height * 4,
        width: width ?? context.width * 45,
        decoration: BoxDecoration(
            color: backgroundColor ?? context.colorScheme.onBackground,
            borderRadius:
                BorderRadius.all(Radius.circular(ApplicationConstants.radius))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: textStyle,
            ),
            SizedBox(
              width: context.lowValue,
            ),
            icon ??
                const SizedBox(
                  width: 0,
                  height: 0,
                )
          ],
        ),
      ),
    );
  }
}
