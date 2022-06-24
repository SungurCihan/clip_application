import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.colorScheme.onSurface)),
      ),
    );
  }
}
