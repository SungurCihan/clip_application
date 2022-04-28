import '../../../../core/constants/app/application_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AccountButton extends StatelessWidget {
  final Icon? icon;
  final String? text;

  const AccountButton({Key? key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.mediumValue),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(ApplicationConstants.radius * 2)),
          color: context.colorScheme.onBackground),
      width: context.width * 90,
      height: context.width * 10,
      child: Padding(
        padding: context.paddingMediumLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon ?? const Icon(IconlyLight.message),
            SizedBox(
              width: context.mediumValue,
            ),
            Text(
              text ?? '',
            )
          ],
        ),
      ),
    );
  }
}
