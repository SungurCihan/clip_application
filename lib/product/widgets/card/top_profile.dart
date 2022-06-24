import '../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/image/image_constants.dart';

class TopProfile extends StatelessWidget {
  const TopProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumTop,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: context.paddingMediumTop * 3,
                child: const Center(
                    child: Text(
                  '50,8K',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
              ),
              Text(
                'Followers',
                style: TextStyle(
                    fontSize: 18, color: context.colorScheme.secondary),
              ),
            ],
          ),
          Container(
            width: context.height * 10,
            height: context.height * 10,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImageConstants.instance.story,
                    ),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.all(
                    Radius.circular(ApplicationConstants.radius)),
                border: Border.all(
                  color: context.colorScheme.primary,
                  style: BorderStyle.solid,
                )),
          ),
          Column(
            children: [
              Padding(
                padding: context.paddingMediumTop * 3,
                child: const Center(
                    child: Text(
                  '700',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
              ),
              Text(
                'Comment',
                style: TextStyle(
                    fontSize: 18, color: context.colorScheme.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
