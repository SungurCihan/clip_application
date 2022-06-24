import 'package:flutter/material.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/navigation/navigation_manager.dart';
import '../../../product/widgets/card/logo.dart';
import '../widgets/button/custom_text_button.dart';
import '../widgets/button/pink_button.dart';

class LoginOrSign extends StatelessWidget {
  const LoginOrSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: context.height * 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 4, child: Logo()),
              const Expanded(flex: 1, child: SizedBox()), //Space
              Expanded(flex: 2, child: _buttons(context)),
              const Expanded(flex: 2, child: SizedBox()) //Space
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PinkButton(
          child: Text(
            'Kayıt Ol',
            style: context.textTheme.bodyText1,
          ),
          onTap: () {
            NavigationManager.instance
                .navigateToPage(path: NavigationCostants.sign);
          },
        ),
        CustomTextButton(
          text: 'Giriş Yap',
          onTap: () {
            NavigationManager.instance
                .navigateToPage(path: NavigationCostants.login);
          },
        ),
      ],
    );
  }
}
