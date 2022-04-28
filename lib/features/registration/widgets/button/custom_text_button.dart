import 'package:flutter/material.dart';

import '../../../../core/constants/app/application_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../product/widgets/ui/shadow_constant.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final VoidCallback? onTap;
  final double? fontSize;

  const CustomTextButton(
      {Key? key, this.text, this.color, this.onTap, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [ShadowConstant.weakBoxShadow]),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text ?? '',
          style: context.textTheme.bodyText1?.copyWith(
              color: color ?? context.colorScheme.primary,
              fontSize: fontSize ?? ApplicationConstants.fontSizeHigh),
        ),
      ),
    );
  }
}
