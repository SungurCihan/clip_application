import 'package:flutter/material.dart';

import '../../../../core/constants/app/application_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../product/widgets/ui/shadow_constant.dart';

class PinkButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;

  const PinkButton({Key? key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * 50,
        height: context.height * 5,
        decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius:
                BorderRadius.all(Radius.circular(ApplicationConstants.radius)),
            boxShadow: [ShadowConstant.boxShadow]),
        child: Center(child: child),
      ),
    );
  }
}
