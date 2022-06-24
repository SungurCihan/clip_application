import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class PriceListItem extends StatelessWidget {
  final String? serviceName;
  final String? price;

  const PriceListItem({Key? key, this.serviceName, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumBottom,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(serviceName ?? ''),
          Row(
            children: [
              Text(price ?? ''),
              Icon(
                Icons.add_outlined,
                color: context.colorScheme.primary,
              )
            ],
          )
        ],
      ),
    );
  }
}
