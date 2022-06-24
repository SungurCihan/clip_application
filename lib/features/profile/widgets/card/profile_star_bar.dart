import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ProfileStarBar extends StatelessWidget {
  const ProfileStarBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 8),
      child: SizedBox(
        height: context.height * 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
                flex: 8,
                child: Text(
                  'The Barber',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )),
            const Expanded(flex: 1, child: SizedBox()),
            VerticalDivider(
              color: context.colorScheme.secondary,
              indent: context.height * 3.5,
              endIndent: context.height * 3.5,
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 8,
              child: Center(
                child: SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: 2.49,
                  color: context.colorScheme.tertiary,
                  borderColor: context.colorScheme.onTertiary,
                  size: context.height * 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
